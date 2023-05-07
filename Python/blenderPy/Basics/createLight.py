import bpy


# you should know that new() method only create object data, you still nedd objects.new()
light_data = bpy.data.lights.new("hh","POINT")
light_object = bpy.data.objects.new('my_light',light_data)


# methods below can both link the object to
# bpy.context.collection.objects.link(light_object)
bpy.data.collections['Collection 2'].objects.link(light_object)