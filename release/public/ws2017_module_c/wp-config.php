<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ws2017_module_c' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
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
define( 'AUTH_KEY',         ' ~!@6E;:C(Q)g2KV*sFFi1hRm;Z!RJ<a=UY,A?B.xkpq]Ime^+s},$B)c8ajx$Z9' );
define( 'SECURE_AUTH_KEY',  '}{oEW5m%|Om!!*Yw@tpv~a  W^U#(lYsIUcO;6a,;*zv2`}=q!s@U*=W(U/gT0:^' );
define( 'LOGGED_IN_KEY',    ',w+<@[u5GWW_D]r}s!Bel@<_=4J(E5.~9ygdq&seV(nVlI[G$jn14}}a}Uo^}}wN' );
define( 'NONCE_KEY',        'C%4788JR9IeN84qfJHF&(:+M4gZdUsS~5ZSqGclS|gkjE!Pzn/w)/sPV5QZP=~*a' );
define( 'AUTH_SALT',        'I$gKdX7$h*]nE(VCiF}+XlH]@)dFM$783t)Ph%<aNL0nNIxJi|hPdxo/zXr~n*^_' );
define( 'SECURE_AUTH_SALT', 'a|uI/$OSHWHIT[2c|9A71yY%^nLociE~x}IU{2^eab;j!P|wecw@2#`h WSx?y3J' );
define( 'LOGGED_IN_SALT',   'V6kjs4z^<H |x<s^CR#|D%5+,A4!TyY3?Fl%$PiaV*O=YytW(Sgu@dNMluk:OC/=' );
define( 'NONCE_SALT',       'F&>o0h4]pC?Dbo7ynrL*&N3Z0IS(1Lj(2ZmD!DXAl7h}$!|[81ZcU7A5g`1kcH.e' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
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
