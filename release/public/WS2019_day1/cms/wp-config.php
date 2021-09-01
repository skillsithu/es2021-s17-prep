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
define( 'DB_NAME', 'ws2019_day1_cms' );

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
define( 'AUTH_KEY',         'tUveZx+C0UcnD5fF}@d-^,WpL,aeJ?V=6r7~c3?j]y=B4p4H6;Fl;m_Nuy5xB0[f' );
define( 'SECURE_AUTH_KEY',  '_}bv ij9;;NDj@/j.log2T_>nDs*uBn.@UDHd2c^L)y;<2%N3owsuTPi=2]wC3z=' );
define( 'LOGGED_IN_KEY',    'l/n<yjS$O.)Qv,t}lMRG_FUNO]`gcief&<Xqiw^W0H2I7loW/{nFaD1GH`u-5c-j' );
define( 'NONCE_KEY',        'x{%E/9X71EP$POqgEqa-6%Nv(T {Rkfd8r%JI*/,#Aw_o7O?I^aO|<?FTQW<f%V}' );
define( 'AUTH_SALT',        'cGsx3}5[qnMqT=(Xh#}Z};&:&+5eON.aZ%`-=FS1lTlS}P})R4|4Ck5Qt03ajGpV' );
define( 'SECURE_AUTH_SALT', '55mEb.tXDEPF}M2Xk$T0Es:yX7?H?-&X*5y<;3^$rsC3<RVsA`NS`/o eEWdj8U<' );
define( 'LOGGED_IN_SALT',   'Zvj)V|E;{<x(QfKrdZ;;lzTbdhYe)%N5w,FDn+|^6ZwVUc vmZRgb$wK8! &*4cq' );
define( 'NONCE_SALT',       '!.8JygXlpW+OUEy~U}y&:wgQQo+v(=tm-?9iPE/I,+nw{zWD?IJo~vx #}H`I.ja' );

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
