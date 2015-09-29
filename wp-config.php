<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'burswood');

/** MySQL database username */
define('DB_USER', 'burswood');

/** MySQL database password */
define('DB_PASSWORD', 'bursw0437*!^');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'e#E_;lXYjjfN}--&unkUDEKh:A9&4jf&n$Nx|h$bLqNGg2To8URs0YwrdxTS|[zx');
define('SECURE_AUTH_KEY',  'Tk#}FR2UuZm)B|}lf<V60wGt<=#B8|/4#%$12a)JD7+*ycomR4Ou~kg;60-DwI}7');
define('LOGGED_IN_KEY',    'Hj{TexY=F[L0Gu^0u&{-5;tM&i3?,_BA`-1@)29C.BOz.ou-WG+,QNE[`Pa83e8(');
define('NONCE_KEY',        '{{Q1*j3}CJM?|M&<G;@&&P>&[1T_6VN30,wiMCg;|EjDAEE<(&Y/pUzH+u3t<2c^');
define('AUTH_SALT',        'Vdu*c:gq~|~g:X-Q~d,$XTFOz5%Oi)bf-#&?Fz1OT?r-d47BwTNI6g;lkEc5i{Cg');
define('SECURE_AUTH_SALT', 'FP3$5MiBh,:W3j6f{HvDYQ._FwKGTZU]0[.-xITj{f|Nd`#r>n:||i2j8ree/bk&');
define('LOGGED_IN_SALT',   'JD6!<vN]:$i`Q2EW:!p[v@[g[bv{~Z^&KonQrYG*]qX|q xx,j5+y?HznBPe4j^C');
define('NONCE_SALT',       '5.le.zB{ER ;|;h|(R^S{MA5ivMz/+Li{X<]+O`X}jc$P[56dus5;t8MM36w97pD');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'bw_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

define('WPCF7_AUTOP', false );

define('WPCF7_SHOW_DONATION_LINK', false );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
