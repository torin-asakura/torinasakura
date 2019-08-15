<?php

// Admin modifications.
require_once 'inc/admin.php';

require_once 'inc/blocks.php';

add_theme_support( 'post-thumbnails', array( 'post', 'page' ) );
add_image_size( 'square-thumbnail', 370, 370, TRUE );
