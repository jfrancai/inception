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
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'NEW_DB_NAME');

/** Database username */
define( 'DB_USER', 'NEW_USER');

/** Database password */
define( 'DB_PASSWORD', 'NEW_DB_PASSWORD');

/** Database hostname */
define( 'DB_HOST', 'NEW_HOST');

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
define( 'AUTH_KEY',         '%PMhM<2h*JFfs3]<V1,L$xBnE&S2i}J2J_8_M0*Vt8e9AO~a$v1PXr7||Wu(%U^@' );
define( 'SECURE_AUTH_KEY',  'V@4]og89;.Z]E^HkKi94,$D]%lXeTX)`-cG^t-3~lb6({p3!}wYNzYew=*}ATz:/' );
define( 'LOGGED_IN_KEY',    'j9<d<*tpCF}yG$la>,4#RB:T(8(L +@tne rRO?( RDl7`lN$l1nw#)9ZL.kT(X&' );
define( 'NONCE_KEY',        'tH-y]:BDe_.k[<81~dR.ft[@YyZ8y&X}z~#0~y/@+#9*_u);CM><8SVlEhhhEcVf' );
define( 'AUTH_SALT',        '`bxr&<<I*Ic?yW?Eear2HyXHAo`5)J^xdv} .<09uIL`8F:LQ.*%<&Q:L&^~H?X.' );
define( 'SECURE_AUTH_SALT', '>L::ZNU0 ;k=l]b7)mBu&e_aoju2nN<g0pj(3c<R.HCwrJHXt!<jqA:KI,(MB{gA' );
define( 'LOGGED_IN_SALT',   '%)p(r3n_^Q]A[Z![I ORf}@d$NWk5WD}x>[xGMz#It30db+M=,RGg;mJA?`)ir:U' );
define( 'NONCE_SALT',       ':Wg5Kyh2~BmR@=82MF+N]~:?n7C&pp02_9VtQ5Yvc#7BykTvZC}RixO@|pccy$,Y' );

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
