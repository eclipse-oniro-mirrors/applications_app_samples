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
import abilityTest from './Ability.test';

import playWithCacheTimeConvertTest from './PlayWithCacheTimeConvert.test';
import playWithCacheVideoLayoutTest from './PlayWithCacheVideoLayout.test';
import playWithCacheSpeedCycleTest from './PlayWithCacheSpeedCycle.test';
import playWithCacheMediaSourceContractTest from './PlayWithCacheMediaSourceContract.test';
import playWithCacheM3U8PlaylistTest from './PlayWithCacheM3U8Playlist.test';
import playWithCacheOfflineCacheStateTest from './PlayWithCacheOfflineCacheState.test';
import playWithCacheRangeRequestTest from './PlayWithCacheRangeRequest.test';
import playWithCacheBufferWindowTest from './PlayWithCacheBufferWindow.test';
import playWithCachePlayerStateTest from './PlayWithCachePlayerState.test';
import playWithCacheAppStorageTest from './PlayWithCacheAppStorage.test';
import playWithCacheSeekContractTest from './PlayWithCacheSeekContract.test';
import playWithCacheUrlContractTest from './PlayWithCacheUrlContract.test';

import playWithCacheEvictionTest from './PlayWithCacheEviction.test';
import playWithCacheQuotaTest from './PlayWithCacheQuota.test';
import playWithCacheVariantTest from './PlayWithCacheVariant.test';
import playWithCacheRetryTest from './PlayWithCacheRetry.test';
import playWithCacheRangeMergeTest from './PlayWithCacheRangeMerge.test';
import playWithCachePrefetchTest from './PlayWithCachePrefetch.test';
import playWithCacheKeyNormalizeTest from './PlayWithCacheKeyNormalize.test';
import playWithCacheProgressTest from './PlayWithCacheProgress.test';
import playWithCacheSegmentPlanTest from './PlayWithCacheSegmentPlan.test';
import playWithCacheFlagsTest from './PlayWithCacheFlags.test';

import playWithCacheM3U8AdvancedTest from './PlayWithCacheM3U8Advanced.test';
import playWithCacheFileLifecycleTest from './PlayWithCacheFileLifecycle.test';
import playWithCacheNetworkErrorTest from './PlayWithCacheNetworkError.test';
import playWithCachePersistenceTest from './PlayWithCachePersistence.test';
import playWithCacheUiSpeedTest from './PlayWithCacheUiSpeed.test';

import playWithCacheM3U8KeysTest from './PlayWithCacheM3U8Keys.test';
import playWithCacheDiskConsistencyTest from './PlayWithCacheDiskConsistency.test';
import playWithCacheNetworkRecoveryTest from './PlayWithCacheNetworkRecovery.test';
import playWithCacheUiSeekTest from './PlayWithCacheUiSeek.test';

import playWithCacheKeyCollisionTest from './PlayWithCacheKeyCollision.test';
import playWithCacheM3U8CryptoTest from './PlayWithCacheM3U8Crypto.test';
import playWithCacheFileRecordTest from './PlayWithCacheFileRecord.test';
import playWithCacheOfflineStateTest from './PlayWithCacheOfflineState.test';
import playWithCacheUiSeekActualTest from './PlayWithCacheUiSeekActual.test';

import playWithCacheFileIoIntegrationTest from './PlayWithCacheFileIoIntegration.test';
import playWithCachePlaybackIntegrationTest from './PlayWithCachePlaybackIntegration.test';

export default function testsuite(): void {
  abilityTest();
  playWithCacheTimeConvertTest();
  playWithCacheVideoLayoutTest();
  playWithCacheSpeedCycleTest();
  playWithCacheMediaSourceContractTest();
  playWithCacheM3U8PlaylistTest();
  playWithCacheOfflineCacheStateTest();
  playWithCacheRangeRequestTest();
  playWithCacheBufferWindowTest();
  playWithCachePlayerStateTest();
  playWithCacheAppStorageTest();
  playWithCacheSeekContractTest();
  playWithCacheUrlContractTest();
  playWithCacheEvictionTest();
  playWithCacheQuotaTest();
  playWithCacheVariantTest();
  playWithCacheRetryTest();
  playWithCacheRangeMergeTest();
  playWithCachePrefetchTest();
  playWithCacheKeyNormalizeTest();
  playWithCacheProgressTest();
  playWithCacheSegmentPlanTest();
  playWithCacheFlagsTest();
  playWithCacheM3U8AdvancedTest();
  playWithCacheFileLifecycleTest();
  playWithCacheNetworkErrorTest();
  playWithCachePersistenceTest();
  playWithCacheUiSpeedTest();
  playWithCacheM3U8KeysTest();
  playWithCacheDiskConsistencyTest();
  playWithCacheNetworkRecoveryTest();
  playWithCacheUiSeekTest();
  playWithCacheKeyCollisionTest();
  playWithCacheM3U8CryptoTest();
  playWithCacheFileRecordTest();
  playWithCacheOfflineStateTest();
  playWithCacheUiSeekActualTest();
  playWithCacheFileIoIntegrationTest();
  playWithCachePlaybackIntegrationTest();
}