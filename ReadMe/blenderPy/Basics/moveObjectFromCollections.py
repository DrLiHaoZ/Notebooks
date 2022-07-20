from ast import Pass
import bpy

collectionFrom = bpy.data.collections['collection1']
collectionTo = bpy.data.collections['collection2']

to_unlink = []

for object in collectionFrom.objects:
    try:
        collectionTo.objects.link(object)
    except RuntimeError:
        Pass
    to_unlink.append(object)

for object in to_unlink:
    collectionFrom.objects.unlink(object)

bpy.data.collections.remove(collectionFrom)