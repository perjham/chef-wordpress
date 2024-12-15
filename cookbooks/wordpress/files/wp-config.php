<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'eW|R[c4+09uR575i+vnva78V^[_Y4F@;S8)-/{;)FPGefOot~2^/(PQ0w(J6SHJb' );
define( 'SECURE_AUTH_KEY',  ' bhNH4Me{[J3@Nx#fO%7eBAxKl^*:;<Fhwq&=j#G}<l$*/QYCng[0+LL(?H0;na4' );
define( 'LOGGED_IN_KEY',    '4O3yG*x$x*nAbi^[g|`V*=1WL:X99xRGr>a)dvF/)NPrR)qQ<%MR~WPlF~Za.M_o' );
define( 'NONCE_KEY',        'zzE_jY0O4MX[Cy>#F$#_A=2N#V;FTtLlIeLFi|COieA95eM{y^?I?|cD~+x+KfQ}' );
define( 'AUTH_SALT',        'P4=1uWDa(+:~wC1*dDf;=oN BIP,S*MT&}|(kZ^+(oB1T@(AoNCm]fy{^xno$(2<' );
define( 'SECURE_AUTH_SALT', 'y!U72(1#`9P?]^]s|#Yi!}-31HW_?d/G-0Kw1dfj{*<!Idj-,p$4$*nG=_@0&1ax' );
define( 'LOGGED_IN_SALT',   '&+t^HDMT%XJe6m}=jduua]Ob6>QC^_2AJXXg37yYU|6:?|X7T1s%=)gz@UyUm7:T' );
define( 'NONCE_SALT',       '(G7/dQG1];Yd/<0/H[SwZCyW:{:%:0H?iBhgXNHQA)bQWpYIpdp8hxyMjNI3(T<n' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

