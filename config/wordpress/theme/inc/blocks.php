<?php

 add_action( 'graphql_register_types', function() {
   register_graphql_object_type( 'ContentBlockAttrs', [
     'description' => 'Gutenberg block attrs',
     'fields' => [
       'columns' => [
         'type' => 'Int',
         'description' => 'core/columns count columns',
       ],
       'dropCap' => [
         'type' => 'Boolean',
         'description' => 'core/paragraph drop cap',
       ],
       'textColor' => [
         'type' => 'String',
         'description' => 'core/paragraph text color',
       ],
       'customTextColor' => [
         'type' => 'String',
         'description' => 'core/paragraph custom tect color',
       ],
       'backgroundColor' => [
         'type' => 'String',
         'description' => 'core/paragraph background color',
       ],
       'customBackgroundColor' => [
         'type' => 'String',
         'description' => 'core/paragraph custom background color',
       ],
       'fontSize' => [
         'type' => 'String',
         'description' => 'core/paragraph font size',
       ],
       'customFontSize' => [
         'type' => 'Int',
         'description' => 'core/paragraph custom font Size color',
       ],
     ],
   ]);
 });

 add_action( 'graphql_register_types', function() {
   register_graphql_object_type( 'ContentBlock', [
     'description' => 'Gutenberg block',
     'fields' => [
       'blockName' => [
           'type' => 'String',
           'description' => 'Block name',
       ],
       'attrs' => [
           'type' => 'ContentBlockAttrs',
           'description' => 'Block attrs',
       ],
       'innerBlocks' => [
         'type' => [
           'list_of' => 'ContentBlock',
         ],
         'description' => 'Gutenberg block',
       ],
       'innerHTML' => [
         'type' => 'String',
         'description' => 'Block html',
       ],
       'innerContent' => [
         'type' => [
           'list_of' => 'String',
         ],
         'description' => 'Block content',
       ],
     ],
   ]);
 });

 add_action( 'graphql_register_types', function() {
   register_graphql_field( 'Page', 'blocks', [
      'type' => [
 				'list_of' => 'ContentBlock',
 			],
      'description' => 'Content blocks',
      'resolve' => function( $post ) {
        $content = ! empty( $post->contentRaw ) ? $post->contentRaw : get_post_field('post_content', $post->ID);

        return parse_blocks( $content );
      }
   ]);
 });

 add_action( 'graphql_register_types', function() {
   register_graphql_field( 'Post', 'blocks', [
      'type' => [
 				'list_of' => 'ContentBlock',
 			],
      'description' => 'Content blocks',
      'resolve' => function( $post ) {
        $content = ! empty( $post->contentRaw ) ? $post->contentRaw : get_post_field('post_content', $post->ID);

        return parse_blocks( $content );
      }
   ]);
 });
