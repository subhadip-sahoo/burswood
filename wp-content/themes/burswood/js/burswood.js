(function($){
    var oAPI = new rcmAPI();
    function DisplStep1() {
        oAPI.LoadCategoryType(document.getElementById("cmbCatType"), '<%=tst("CategoryTypeID")%>');
        oAPI.LoadAgeList(document.getElementById("cmbAge"), '<%=tst("Age")%>');
        oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"), document.getElementById("cmbAge"), '<%=tst("PickupLocationID")%>', '<%=tst("DropOffLocationID")%>');

        $('#txtPickupTime').datetimepicker({
            datepicker: false,
            mask: true,
            format: 'H:i',
            closeOnDateSelect: true,
            step: 30,
            onChangeDateTime: function (ct, $i) {
                $i.datetimepicker('hide');
            }
        });
        $('#txtPickupTime').val('<%=tst("PickupTime")%>' == '' ? "10:00" : '<%=tst("PickupTime")%>');
        $('#txtReturnTime').datetimepicker({
          datepicker: false,
          mask: true,
          format: 'H:i',
          closeOnDateSelect: true,
          step: 30,
          onChangeDateTime: function (ct, $i) {
            $i.datetimepicker('hide');
          }
        });
      $('#txtReturnTime').val('<%=tst("ReturnTime")%>' == '' ? "10:00" : '<%=tst("ReturnTime")%>');
      var pickUpID = document.getElementById("cmbPickup").value;
      var startPickup = Math.ceil(oAPI.GetNoticePeriod(pickUpID))+1;
      var startDropOff = eval(startPickup + '+' + oAPI.MinBookingDay(pickUpID));
      if (startPickup ==startDropOff) startDropOff = startDropOff+7;

      $('#txtPickup').datetimepicker({
        timepicker: false,
        mask: true,
        format: 'd/m/Y',
        formatDate: 'd/m/Y',
        closeOnDateSelect: true,
        scrollInput: false,
        minDate: rcmGetdate(startPickup-1),
        onChangeDateTime: function (dp, $input) {
          //alert($input.val());
          //$('#txtReturn').val(eval($input.val() + 1));
          $('#txtReturn').val(geFutureDate($input.val(), 7));
        }
      });
      
      $('#txtPickup').val('<%=tst("PickupDate")%>' == '' ? rcmGetdate(startPickup) : '<%=tst("PickupDate")%>');
      $('#txtReturn').datetimepicker({
        timepicker: false,
        mask: true,
        format: 'd/m/Y',
        formatDate: 'd/m/Y',
        closeOnDateSelect: true,
        scrollInput: false,
        minDate: geFutureDate($('#txtPickup').val(), 1),//rcmGetdate(startDropOff)
        onChangeDateTime: logic,
        onShow: logic
      });
      $('#txtReturn').val('<%=tst("ReturnDate")%>' == '' ? rcmGetdate(startDropOff) : '<%=tst("ReturnDate")%>');
      var PickUpDW = 0;
      var DropOffDW = 0;
      // Get Day of the week using function rcmGetDW(<datestring>,<format>)
      if (document.getElementById("txtPickup").value != '' && document.getElementById("txtPickup").value != '__/__/____') {
        PickUpDW = rcmGetDW(document.getElementById("txtPickup").value, "d/m/Y");
      }
      if (document.getElementById("txtReturn").value != '' && document.getElementById("txtReturn").value != '__/__/____') {
        DropOffDW = rcmGetDW(document.getElementById("txtReturn").value, "d/m/Y");
      }
      $('#txtPickupTime').datetimepicker({
        minTime: oAPI.MinTimePickup(pickUpID, PickUpDW),
        maxTime: oAPI.MaxTimePickup(pickUpID, PickUpDW)
      });
      $('#txtReturnTime').datetimepicker({
        minTime: oAPI.MinTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW),
        maxTime: oAPI.MaxTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW)
      });
    }
    $(function(){
        var maxWidth = Math.max.apply(null, $(window).map(function () {
            return $(this).outerWidth(true);
        }).get());
        //console.log(maxWidth);
        oAPI.OnReadyStep1(DisplStep1);
        oAPI.OnLocationChange(LocUpdForm);
        oAPI.GetStep1();

        $('#fat-btn').click(function () {
          //debugger;
          //$(this).text('loading.');
          $(this).addClass('btn-danger');
          $(this).toggleClass('active');
        });
    });
})(jQuery);
