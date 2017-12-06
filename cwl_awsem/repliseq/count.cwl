{
    "hints": [
        {
            "dockerPull": "duplexa/4dn-repliseq:v9",
            "class": "DockerRequirement"
        }
    ],
    "arguments": [],
    "class": "CommandLineTool",
    "inputs": [
        {
            "type": [
                "File"
            ],
            "id": "#input_bam",
            "inputBinding": {
                "position": 1,
                "separate": true
            }
        },
        {
            "type": [
                "null",
                "File"
            ],
            "inputBinding": {
                "separate": true,
                "position": 2
            },
            "id": "#chrsizes"
        },
        {
            "type": [
                "int"
            ],
            "id": "#winsize",
            "inputBinding": {
                "position": 5,
                "separate": true
            },
            "default": 5000
        },
        {
            "type": [
                "null",
                "string"
            ],
            "id": "#outprefix",
            "inputBinding": {
                "position": 4,
                "separate": true
            },
            "default": "out"
        },
        {
            "type": [
                "null",
                "string"
            ],
            "id": "#outdir",
            "inputBinding": {
                "position": 3,
                "separate": true
            },
            "default": "."
        }
    ],
    "outputs": [
        {
            "type": [
                "null",
                "File"
            ],
            "id": "#out_count_bg",
            "outputBinding": {
                "glob": "$(inputs.outdir + '/' + inputs.outprefix + '.w' + inputs.winsize + '.bg')"
            }
        }
    ],
    "baseCommand": [
        "count"
    ],
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "cwlVersion": "draft-3"
}
