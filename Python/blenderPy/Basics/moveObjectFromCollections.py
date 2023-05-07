
import bpy

collectionFrom = bpy.data.collections['collection1']
collectionTo = bpy.data.collections['collection2']

to_unlink = []

for object in collectionFrom.objects:
    try:
        collectionTo.objects.link(object)
        collectionFrom.objects.unlink(object)
    except RuntimeError:
        pass
    to_unlink.append(object)

#for object in to_unlink:
    

#bpy.data.collections.remove(collectionFrom)