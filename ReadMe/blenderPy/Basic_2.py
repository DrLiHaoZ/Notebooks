import bpy

bpy.ops.mesh.primitive_uv_sphere_add()
bpy.context.scene.frame_end = 200


ob = bpy.data.objects['Sphere']

bpy.context.scene.frame_set(0)
bpy.ops.anim.keyframe_insert_menu(type='Location')

bpy.context.scene.frame_set(100)
ob.location = (1,2,-1)
bpy.ops.anim.keyframe_insert_menu(type='Location')


bpy.context.scene.frame_set(200)
ob.location = (0,0,0)
bpy.ops.anim.keyframe_insert_menu(type='Location')