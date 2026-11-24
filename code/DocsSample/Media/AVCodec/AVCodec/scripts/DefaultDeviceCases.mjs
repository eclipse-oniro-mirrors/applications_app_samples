/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 与默认Hypium套件同步维护。轮询基准通过显式范围单独执行。
export const DEFAULT_DEVICE_CASES = Object.freeze([
  'CameraDataModelTest#AVCodec_CameraDataModel_CodecConfiguration_002',
  'CameraDataModelTest#AVCodec_CameraDataModel_DefaultConfiguration_001',
  'CameraDataModelTest#AVCodec_CameraDataModel_ResolutionAndBitrate_003',
  'CommonConstantsTest#AVCodec_CommonConstants_ContainerFormats_001',
  'CommonConstantsTest#AVCodec_CommonConstants_NativeWindowTransforms_004',
  'CommonConstantsTest#AVCodec_CommonConstants_PlayerSettings_002',
  'CommonConstantsTest#AVCodec_CommonConstants_RecorderSettings_003',
  'DateTimeUtilTest#AVCodec_DateTimeUtil_DateFormatting_002',
  'DateTimeUtilTest#AVCodec_DateTimeUtil_MillisecondFormatting_003',
  'DateTimeUtilTest#AVCodec_DateTimeUtil_SecondFormatting_004',
  'DateTimeUtilTest#AVCodec_DateTimeUtil_TimePadding_001',
  'MediaInfoModelTest#AVCodec_MediaInfo_GraphicsRunModes_004',
  'MediaInfoModelTest#AVCodec_MediaInfo_MissingTrackHandling_002',
  'MediaInfoModelTest#AVCodec_MediaInfo_StructuredAndRawSections_001',
  'MediaInfoModelTest#AVCodec_MediaInfo_UnavailableMedia_003',
  'MediaUtilsTest#AVCodec_MediaUtils_EmptyMediaFile_005',
  'MediaUtilsTest#AVCodec_MediaUtils_EmptyPickerIndex_003',
  'MediaUtilsTest#AVCodec_MediaUtils_PickerIndexRange_004',
  'MediaUtilsTest#AVCodec_MediaUtils_PickerIndexes_001',
  'MediaUtilsTest#AVCodec_MediaUtils_PickerValues_002',
  'PlaybackHistoryModelTest#AVCodec_PlaybackHistory_Title_001',
  'PlaybackInfoModelTest#AVCodec_PlaybackInfo_MediaTime_001',
  'PlaybackInfoModelTest#AVCodec_PlaybackInfo_PlayingSnapshot_002',
  'PlaybackInfoModelTest#AVCodec_PlaybackInfo_SeekPositionNormalization_004',
  'PlaybackInfoModelTest#AVCodec_PlaybackInfo_SeekingSnapshot_003',
  'PlaybackPolicyTest#AVCodec_PlaybackMode_Boundaries_001',
  'PlaybackPolicyTest#AVCodec_PlaybackMode_Shuffle_002',
  'PlaybackPolicyTest#AVCodec_Recovery_CancelAndReset_002',
  'PlaybackPolicyTest#AVCodec_Recovery_OneRetry_001',
  'PlaybackPolicyTest#AVCodec_SubtitleStyle_Reset_001',
  'PlaybackViewModelTest#AVCodec_PlaybackViewModel_ResetState_001',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_AllOptions_001',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_AudioTrack_005',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_AudioVolume_004',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_BufferModeDisablesHdrConversion_006',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_DumpOnlyInBufferMode_007',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_InvalidInput_002',
  'PlayerSettingsModelTest#AVCodec_PlayerSettings_StructuredOptions_003',
  'RecorderSettingsModelTest#AVCodec_RecorderSettings_AdvancedOptions_003',
  'RecorderSettingsModelTest#AVCodec_RecorderSettings_AllOptions_001',
  'RecorderSettingsModelTest#AVCodec_RecorderSettings_CenterCrop_004',
  'RecorderSettingsModelTest#AVCodec_RecorderSettings_DropFrameRateNotHigherThanSource_005',
  'RecorderSettingsModelTest#AVCodec_RecorderSettings_IncompleteOptions_002',
  'SeekRequestControllerTest#AVCodec_SeekQueue_FailureAndReuse_004',
  'SeekRequestControllerTest#AVCodec_SeekQueue_ImmediateAndLatestPending_001',
  'SeekRequestControllerTest#AVCodec_SeekQueue_SingleWorker_002',
  'SeekRequestControllerTest#AVCodec_SeekQueue_StopInvalidates_003',
  'SubtitleModelTest#AVCodec_SubtitleModel_InvalidContent_002',
  'SubtitleModelTest#AVCodec_SubtitleModel_ParseAndLocateCue_001',
]);
