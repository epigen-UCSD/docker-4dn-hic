{
    "cwlVersion": "draft-3",
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "outputs": [
        {
            "outputBinding": {
                "glob": "$(inputs.output_dir + '/fend_object.hdf5')"
            },
            "type": [
                "null",
                "File"
            ],
            "id": "#fend_object_hdf5"
        },
        {
            "outputBinding": {
                "glob": "$(inputs.output_dir + '/HiC_data_object.hdf5')"
            },
            "type": [
                "null",
                "File"
            ],
            "id": "#HiC_data_object_hdf5"
        },
        {
            "outputBinding": {
                "glob": "$(inputs.output_dir + '/HiC_distance_function.hdf5')"
            },
            "type": [
                "null",
                "File"
            ],
            "id": "#HiC_distance_function_hdf5"
        },
        {
            "outputBinding": {
                "glob": "$(inputs.output_dir + '/HiC_norm_binning.hdf5')"
            },
            "type": [
                "null",
                "File"
            ],
            "id": "#HiC_norm_binning_hdf5"
        },
        {
            "outputBinding": {
                "glob": "$(inputs.output_dir + '/HiC_project_object.hdf5' )"
            },
            "type": [
                "null",
                "File"
            ],
            "id": "#HiC_project_object_hdf5"
        }
    ],
    "class": "CommandLineTool",
    "arguments": [],
    "baseCommand": [
        "run.sh"
    ],
    "inputs": [
        {
            "id": "#input_bam1",
            "type": [
                "File"
            ],
            "inputBinding": {
                "separate": false,
                "position": 1
            }
        },
        {
            "id": "#input_bam2",
            "type": [
                "File"
            ],
            "inputBinding": {
                "separate": false,
                "position": 2
            }
        },
        {
            "id": "#output_dir",
            "type": [
                "null",
                "string"
            ],
            "inputBinding": {
                "separate": false,
                "position": 4,
                "valueFrom": {
                    "script": "$job.inputs.output_dir || '.'",
                    "engine": "#cwl-js-engine",
                    "class": "Expression"
                }
            }
        },
        {
            "id": "#RE_bed",
            "type": [
                "null",
                "File"
            ],
            "inputBinding": {
                "separate": false,
                "position": 3
            }
        }
    ],
    "hints": [
        {
            "class": "DockerRequirement",
            "dockerPull": "duplexa/hictool-bam2hdf5:v2"
        }
    ]
}