import bpy

positions = (0,1,1),(4,1,6,),(3,-5,1),(3,10,1)
start_pos = (0,0,0)

ob = bpy.data.objects["Sphere"]

frame_num = 0

for position in positions:
    bpy.context.scene.frame_set(frame_num)
    ob.location = position
    ob.keyframe_insert(data_path = "location", index = -1)
    frame_num += 20

