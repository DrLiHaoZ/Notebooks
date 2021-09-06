import bpy
import math


bpy.ops.mesh.primitive_cube_add(location=(0, 0, 0))
ob = bpy.data.objects["Cube"]

x = 0
y = 0 
z = 0

frame_number = 0

for i in range(0,500):
    bpy.context.scene.frame_set(frame_number)
    x += 0.1
    y += 0.1 
    z += 0.1 
    ob.location = (x,y,z)
    ob.keyframe_insert(data_path = "location", index  = -1)
    frame_number += 1
    


# use particle system to generate the line!!! very clever!!!!