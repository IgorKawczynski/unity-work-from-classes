{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "MeshFiltering": "3.0",
            "FeatureExtraction": "1.2",
            "DepthMapFilter": "3.0",
            "StructureFromMotion": "3.1",
            "ImageMatching": "2.0",
            "CameraInit": "9.0",
            "DepthMap": "4.0",
            "PrepareDenseScene": "3.0",
            "Texturing": "6.0",
            "Meshing": "7.0",
            "FeatureMatching": "2.0"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "b7ce84b89ef8f1a6e8482d7178684e293755394b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": false,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "fbc338a50992a01ee11f68b330a19815b35f5856"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 10,
                "size": 58,
                "split": 6
            },
            "uids": {
                "0": "f905f30f6681609c5b8b1bc4c2d3adede01c9166"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 58,
                "split": 1
            },
            "uids": {
                "0": "498911c28505070a9a4fbfcff71bf3feb7a18d7e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 58,
                "split": 2
            },
            "uids": {
                "0": "6c65989ed427f6bac410fe5a41bac7bb7009e567"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 58,
                "split": 1
            },
            "uids": {
                "0": "bbbb2433a8fcbcb27e714a4cd3fa3a85184c3525"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 58,
                "split": 2
            },
            "uids": {
                "0": "ff912ec79ebb03b759d71de5a0ae0e304c3eba57"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 58,
                "split": 1
            },
            "uids": {
                "0": "6f31c23e9619365e8cd85aef0af86294502ee539"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 60074150,
                        "poseId": 60074150,
                        "path": "E:/Pobrane/Igor/DSC_0357.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:57\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"720\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 109560312,
                        "poseId": 109560312,
                        "path": "E:/Pobrane/Igor/DSC_0338.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:32\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:32\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:32\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 167298491,
                        "poseId": 167298491,
                        "path": "E:/Pobrane/Igor/DSC_0343.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:01\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 213127546,
                        "poseId": 213127546,
                        "path": "E:/Pobrane/Igor/DSC_0341.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:18:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:18:44\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:18:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 241879529,
                        "poseId": 241879529,
                        "path": "E:/Pobrane/Igor/DSC_0362.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:27\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 248061356,
                        "poseId": 248061356,
                        "path": "E:/Pobrane/Igor/DSC_0360.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:17\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:17\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:17\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 335693155,
                        "poseId": 335693155,
                        "path": "E:/Pobrane/Igor/DSC_0346.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:31\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 382729970,
                        "poseId": 382729970,
                        "path": "E:/Pobrane/Igor/DSC_0318.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:14:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:14:19\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:14:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 393418072,
                        "poseId": 393418072,
                        "path": "E:/Pobrane/Igor/DSC_0314.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:07:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:07:00\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:07:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 429577333,
                        "poseId": 429577333,
                        "path": "E:/Pobrane/Igor/DSC_0350.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:26\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 466402645,
                        "poseId": 466402645,
                        "path": "E:/Pobrane/Igor/DSC_0331.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:53\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 482639274,
                        "poseId": 482639274,
                        "path": "E:/Pobrane/Igor/DSC_0344.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:21\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 490211599,
                        "poseId": 490211599,
                        "path": "E:/Pobrane/Igor/DSC_0334.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:13\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 501933637,
                        "poseId": 501933637,
                        "path": "E:/Pobrane/Igor/DSC_0347.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:34\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 525565692,
                        "poseId": 525565692,
                        "path": "E:/Pobrane/Igor/DSC_0333.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:07\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 549944389,
                        "poseId": 549944389,
                        "path": "E:/Pobrane/Igor/DSC_0358.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:01\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 594826653,
                        "poseId": 594826653,
                        "path": "E:/Pobrane/Igor/DSC_0332.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:58\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 609686218,
                        "poseId": 609686218,
                        "path": "E:/Pobrane/Igor/DSC_0326.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:22\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 659876630,
                        "poseId": 659876630,
                        "path": "E:/Pobrane/Igor/DSC_0352.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:35\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 692223361,
                        "poseId": 692223361,
                        "path": "E:/Pobrane/Igor/DSC_0313.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:06:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:06:40\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:06:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 742136384,
                        "poseId": 742136384,
                        "path": "E:/Pobrane/Igor/DSC_0354.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:44\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"720\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 762818478,
                        "poseId": 762818478,
                        "path": "E:/Pobrane/Igor/DSC_0317.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:14:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:14:08\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:14:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 814160853,
                        "poseId": 814160853,
                        "path": "E:/Pobrane/Igor/DSC_0339.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:38\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 816353010,
                        "poseId": 816353010,
                        "path": "E:/Pobrane/Igor/DSC_0353.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:39\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"720\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 829793633,
                        "poseId": 829793633,
                        "path": "E:/Pobrane/Igor/DSC_0330.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:49\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:49\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:49\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 847035864,
                        "poseId": 847035864,
                        "path": "E:/Pobrane/Igor/DSC_0359.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:05\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"720\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 863735896,
                        "poseId": 863735896,
                        "path": "E:/Pobrane/Igor/DSC_0322.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:29\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:29\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:29\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 872193868,
                        "poseId": 872193868,
                        "path": "E:/Pobrane/Igor/DSC_0325.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:09\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 920356355,
                        "poseId": 920356355,
                        "path": "E:/Pobrane/Igor/DSC_0351.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:31\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 966691768,
                        "poseId": 966691768,
                        "path": "E:/Pobrane/Igor/DSC_0328.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:33\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:33\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:33\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 976446257,
                        "poseId": 976446257,
                        "path": "E:/Pobrane/Igor/DSC_0323.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:36\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 992165318,
                        "poseId": 992165318,
                        "path": "E:/Pobrane/Igor/DSC_0340.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:18:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:18:34\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:18:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1109406726,
                        "poseId": 1109406726,
                        "path": "E:/Pobrane/Igor/DSC_0364.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:41\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"450\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1153816318,
                        "poseId": 1153816318,
                        "path": "E:/Pobrane/Igor/DSC_0345.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:26\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"450\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1223057615,
                        "poseId": 1223057615,
                        "path": "E:/Pobrane/Igor/DSC_0311.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:03:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:03:58\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:03:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1299817387,
                        "poseId": 1299817387,
                        "path": "E:/Pobrane/Igor/DSC_0342.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:18:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:18:54\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:18:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1334563345,
                        "poseId": 1334563345,
                        "path": "E:/Pobrane/Igor/DSC_0310.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:03:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:03:43\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:03:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1360400043,
                        "poseId": 1360400043,
                        "path": "E:/Pobrane/Igor/DSC_0337.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:27\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1366564196,
                        "poseId": 1366564196,
                        "path": "E:/Pobrane/Igor/DSC_0320.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:15\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1371936820,
                        "poseId": 1371936820,
                        "path": "E:/Pobrane/Igor/DSC_0327.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:27\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1422187096,
                        "poseId": 1422187096,
                        "path": "E:/Pobrane/Igor/DSC_0312.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:04:10\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:04:10\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:04:10\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1436444308,
                        "poseId": 1436444308,
                        "path": "E:/Pobrane/Igor/DSC_0321.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:23\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1603424161,
                        "poseId": 1603424161,
                        "path": "E:/Pobrane/Igor/DSC_0319.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:05\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1615378677,
                        "poseId": 1615378677,
                        "path": "E:/Pobrane/Igor/DSC_0366.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:22:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:22:03\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:22:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1618671233,
                        "poseId": 1618671233,
                        "path": "E:/Pobrane/Igor/DSC_0363.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:34\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"450\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1677371349,
                        "poseId": 1677371349,
                        "path": "E:/Pobrane/Igor/DSC_0349.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:45\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1725920088,
                        "poseId": 1725920088,
                        "path": "E:/Pobrane/Igor/DSC_0356.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:52\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1737503202,
                        "poseId": 1737503202,
                        "path": "E:/Pobrane/Igor/DSC_0361.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:22\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1768337468,
                        "poseId": 1768337468,
                        "path": "E:/Pobrane/Igor/DSC_0355.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:20:48\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:20:48\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:20:48\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1826741384,
                        "poseId": 1826741384,
                        "path": "E:/Pobrane/Igor/DSC_0335.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:18\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:18\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:18\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1851576890,
                        "poseId": 1851576890,
                        "path": "E:/Pobrane/Igor/DSC_0336.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:17:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:17:23\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:17:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1871856530,
                        "poseId": 1871856530,
                        "path": "E:/Pobrane/Igor/DSC_0315.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:07:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:07:09\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:07:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1894045111,
                        "poseId": 1894045111,
                        "path": "E:/Pobrane/Igor/DSC_0348.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:19:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:19:39\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:19:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1945793300,
                        "poseId": 1945793300,
                        "path": "E:/Pobrane/Igor/DSC_0316.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:13:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:13:56\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:13:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2005112753,
                        "poseId": 2005112753,
                        "path": "E:/Pobrane/Igor/DSC_0365.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:21:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:21:51\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:21:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2035512533,
                        "poseId": 2035512533,
                        "path": "E:/Pobrane/Igor/DSC_0324.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:15:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:15:44\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:15:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2074701245,
                        "poseId": 2074701245,
                        "path": "E:/Pobrane/Igor/DSC_0309.JPG",
                        "intrinsicId": 3588364702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:03:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:03:24\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:03:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"34\", \"Exif:FocalLengthIn35mmFilm\": \"51\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.2\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2086448825,
                        "poseId": 2086448825,
                        "path": "E:/Pobrane/Igor/DSC_0329.JPG",
                        "intrinsicId": 755916090,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2023:11:27 20:16:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2023:11:27 20:16:39\", \"Exif:DateTimeOriginal\": \"2023:11:27 20:16:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.333333\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"3\", \"Exif:Flash\": \"79\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"32\", \"Exif:FocalLengthIn35mmFilm\": \"48\", \"Exif:GainControl\": \"1\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.1\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"560\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.01 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 755916090,
                        "initialFocalLength": 32.0,
                        "focalLength": 32.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "E:/Pobrane/Igor_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3588364702,
                        "initialFocalLength": 34.00000000000001,
                        "focalLength": 34.00000000000001,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "E:/Pobrane/Igor_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 3,
                "size": 58,
                "split": 20
            },
            "uids": {
                "0": "971e9ae3066e86bedfce0355a8204d59fb541480"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "43d35edfb71b3a7f8cea9c00fb917e9c856dc016"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 58,
                "split": 3
            },
            "uids": {
                "0": "39fb476ab7933194bf16da53c346100709479577"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}