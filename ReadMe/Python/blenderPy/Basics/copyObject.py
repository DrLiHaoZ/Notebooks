import bpy


positions = [[0,0,0],[1,1,1],[2,2,2],[3,3,3]]

def copy_object(object_name:str, positions):
    #首先取消选择所有的物体
    for obj in bpy.data.objects : 
        obj.select_set(False)

    object_collection = []
    count = len(positions)
    obj_from = bpy.data.objects[objec
    
    t_name]
    
    #然后逐一复制并注意取消选择
    for i in range(count): 
        obj_from.select_set(True)
        bpy.ops.object.duplicate(linked = False)
        object_collection.append(bpy.context.selected_objects[0])
        object_collection[i].location = positions[i]
        #取消选择
        for o in bpy.data.objects : 
            o.select_set(False)
    
    return object_collection
            