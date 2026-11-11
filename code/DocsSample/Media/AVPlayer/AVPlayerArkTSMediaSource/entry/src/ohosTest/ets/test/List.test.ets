import abilityTest from './Ability.test';
import mediaSourceRangeCoreTest from './MediaSourceRangeCore.test';
import mediaSourceRangeTailTest from './MediaSourceRangeTail.test';
import mediaSourceStateCoreTest from './MediaSourceStateCore.test';
import mediaSourceStateTailTest from './MediaSourceStateTail.test';
import mediaSourceFileInfoCoreTest from './MediaSourceFileInfoCore.test';
import mediaSourceFileInfoTailTest from './MediaSourceFileInfoTail.test';
import mediaSourceHlsCoreTest from './MediaSourceHlsCore.test';
import mediaSourceHlsTailTest from './MediaSourceHlsTail.test';
import mediaSourceRequestCoreTest from './MediaSourceRequestCore.test';
import mediaSourceRequestTailTest from './MediaSourceRequestTail.test';
import mediaSourceTimeCoreTest from './MediaSourceTimeCore.test';
import mediaSourceAssetCoreTest from './MediaSourceAssetCore.test';
import mediaSourceTimeConvertEdgeTest from './MediaSourceTimeConvertEdge.test';
import mediaSourceVideoLayoutTest from './MediaSourceVideoLayout.test';
import mediaSourceSpeedCycleTest from './MediaSourceSpeedCycle.test';
import mediaSourceDownloadPathTest from './MediaSourceDownloadPath.test';
import mediaSourceRequestHandleTest from './MediaSourceRequestHandle.test';
import mediaSourcePlayerLifecycleTest from './MediaSourcePlayerLifecycle.test';
import mediaSourceDownloadContractTest from './MediaSourceDownloadContract.test';
import mediaSourceSpeedMappingTest from './MediaSourceSpeedMapping.test';
import mediaSourceHttpResponseTest from './MediaSourceHttpResponse.test';
import mediaSourceLoaderLifecycleTest from './MediaSourceLoaderLifecycle.test';
import mediaSourceSubtitleDefaultsTest from './MediaSourceSubtitleDefaults.test';
import mediaSourceAppStorageContractTest from './MediaSourceAppStorageContract.test';
import mediaSourceSeekContractTest from './MediaSourceSeekContract.test';
import mediaSourcePredownloadContractTest from './MediaSourcePredownloadContract.test';
import mediaSourceRangeParserTest from './MediaSourceRangeParser.test';
import mediaSourceRawFdContractTest from './MediaSourceRawFdContract.test';
import mediaSourceUiPlaybackTest from './MediaSourceUiPlayback.test';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */






import mediaSourceHlsPlaylistCoreTest from './MediaSourceHlsPlaylistCore.test';
import mediaSourceSegmentCacheCoreTest from './MediaSourceSegmentCacheCore.test';
import mediaSourceBufferWindowCoreTest from './MediaSourceBufferWindowCore.test';
import mediaSourceSeekWindowCoreTest from './MediaSourceSeekWindowCore.test';
import mediaSourceSpeedTimelineCoreTest from './MediaSourceSpeedTimelineCore.test';
import mediaSourceDownloadRetryCoreTest from './MediaSourceDownloadRetryCore.test';
import mediaSourceUrlContractCoreTest from './MediaSourceUrlContractCore.test';
import mediaSourceStateGuardCoreTest from './MediaSourceStateGuardCore.test';
import mediaSourceQueuePriorityCoreTest from './MediaSourceQueuePriorityCore.test';

export default function testsuite(): void {
  abilityTest();
  mediaSourceRangeCoreTest();
  mediaSourceRangeTailTest();
  mediaSourceStateCoreTest();
  mediaSourceStateTailTest();
  mediaSourceFileInfoCoreTest();
  mediaSourceFileInfoTailTest();
  mediaSourceHlsCoreTest();
  mediaSourceHlsTailTest();
  mediaSourceRequestCoreTest();
  mediaSourceRequestTailTest();
  mediaSourceTimeCoreTest();
  mediaSourceAssetCoreTest();
  mediaSourceTimeConvertEdgeTest();
  mediaSourceVideoLayoutTest();
  mediaSourceSpeedCycleTest();
  mediaSourceDownloadPathTest();
  mediaSourceRequestHandleTest();
  mediaSourcePlayerLifecycleTest();
  mediaSourceDownloadContractTest();
  mediaSourceSpeedMappingTest();
  mediaSourceHttpResponseTest();
  mediaSourceLoaderLifecycleTest();
  mediaSourceSubtitleDefaultsTest();
  mediaSourceAppStorageContractTest();
  mediaSourceSeekContractTest();
  mediaSourcePredownloadContractTest();
  mediaSourceRangeParserTest();
  mediaSourceRawFdContractTest();
  mediaSourceUiPlaybackTest();
  mediaSourceHlsPlaylistCoreTest();
  mediaSourceSegmentCacheCoreTest();
  mediaSourceBufferWindowCoreTest();
  mediaSourceSeekWindowCoreTest();
  mediaSourceSpeedTimelineCoreTest();
  mediaSourceDownloadRetryCoreTest();
  mediaSourceUrlContractCoreTest();
  mediaSourceStateGuardCoreTest();
  mediaSourceQueuePriorityCoreTest();
}
