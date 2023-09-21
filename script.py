import os
import json
from uuid import uuid4

directory = "./"
target = "./result_files/"
for filename in os.listdir(directory):
    result = []
    if filename.endswith('.json'):
        with open(os.path.join(directory, filename)) as f:
            content = f.read()
            content = json.loads(content)

            for message in content["Messages"]:
                message_content = {"Id": str(uuid4())}
                body = json.loads(message["Body"])
                body["current_step"] = "bvs_full_valida_id_policies"
                message_content["MessageBody"] = json.dumps(body)
                result.append(message_content)

        result_file = open(target + filename, "x")
        result_file.write(json.dumps(result))
        result_file.close()
