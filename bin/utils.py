import re
import json

def remove_path(filename):
    return re.search(r"[^\/]+$", filename).group(0)

def change_extension(filename, ex):
    return re.sub("(\.html?|\.cms|\.ece\d?)$", "." + ex, filename)

def write_to_json(data, filename, extension=None):
    if extension is not None:
        filename = re.sub("(\.html?|\.cms|\.ece\d?)$", "." + extension, filename)

    json.dump(data, open(filename, "w", encoding="utf-8"), ensure_ascii=False, sort_keys=True)

def load_from_json(data):
    data = re.sub(r"[QUOTE]", r"'", data)
    #data = re.sub(r'\!', r'!', data)
    return json.loads(data)
    
def dump_to_json(data):
    data = json.dumps(data, sort_keys=True)
    data = re.sub(r"'", r"[QUOTE]", data)
    #data = re.sub(r'!', r'\!', data)
    return data


    # ["id", "text","title","length","creation_time","last_update_time","temporal_tags"->span_list,"place_names"->object_list,"participants"->span_list,"organizers"->span_list,"targets"->span_list,"triggers"->span_list,"targets"->span_list]
