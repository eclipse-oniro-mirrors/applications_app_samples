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

import addressCrossTest from './AddressCrossMatrix.test';
import addressGridTest from './AddressGridMatrix.test';
import bluetoothProfileDataTest from './BluetoothProfileData.test';
import bluetoothProfileDeviceTest from './BluetoothProfileDevice.test';
import bluetoothProfilesTest from './BluetoothProfiles.test';
import catalogCrossTest from './CatalogCrossMatrix.test';
import codeCrossTest from './CodeCrossMatrix.test';
import contractGridTest from './ContractGridMatrix.test';
import deviceAccessTest from './DeviceAccessMatrix.test';
import deviceEnumTest from './DeviceEnumMatrix.test';
import deviceRealTest from './DeviceRealSessionMatrix.test';
import featureCrossTest from './FeatureCrossMatrix.test';
import formatCrossTest from './FormatCrossMatrix.test';
import logCrossTest from './LogCrossMatrix.test';
import profileAddressTest from './ProfileAddressMatrix.test';
import profileCatalogTest from './ProfileCatalogMatrix.test';
import profileConstantTest from './ProfileConstantContract.test';
import profileErrorUtilTest from './ProfileErrorUtilMatrix.test';
import profileFormatTest from './ProfileFormatMatrix.test';
import profileLogStoreTest from './ProfileLogStoreMatrix.test';
import profileSnapshotTest from './ProfileSnapshotMatrix.test';
import profileStateClassifyTest from './ProfileStateClassify.test';
import profileStatePredicateTest from './ProfileStatePredicate.test';
import profileStateTextTest from './ProfileStateText.test';
import profileViewStateTest from './ProfileViewStateMatrix.test';
import qualityBoundaryTest from './QualityBoundaryMatrix.test';
import qualityFeatureTest from './QualityFeatureMatrix.test';
import qualityInvariantTest from './QualityInvariantMatrix.test';
import qualitySequenceTest from './QualitySequenceMatrix.test';
import sessionCallbackTest from './SessionCallbackMatrix.test';
import sessionChainTest from './SessionChainMatrix.test';
import sessionCreateTest from './SessionCreateMatrix.test';
import sessionCrossTest from './SessionCrossMatrix.test';
import sessionDeviceTest from './SessionDeviceMatrix.test';
import sessionReleaseTest from './SessionReleaseMatrix.test';
import sessionStateTest from './SessionStateMatrix.test';
import sessionSubscribeTest from './SessionSubscribeMatrix.test';
import snapshotCrossTest from './SnapshotCrossMatrix.test';
import snapshotCubeTest from './SnapshotCubeMatrix.test';
import stateCrossTest from './StateCrossMatrix.test';
import thrownTextCrossTest from './ThrownTextCrossMatrix.test';
import viewCrossTest from './ViewCrossMatrix.test';

export default function testsuite() {
  bluetoothProfilesTest();
  bluetoothProfileDataTest();
  bluetoothProfileDeviceTest();
  profileStateClassifyTest();
  profileStateTextTest();
  profileStatePredicateTest();
  profileAddressTest();
  profileCatalogTest();
  profileLogStoreTest();
  profileFormatTest();
  profileSnapshotTest();
  profileViewStateTest();
  profileErrorUtilTest();
  profileConstantTest();
  sessionCreateTest();
  sessionDeviceTest();
  sessionStateTest();
  sessionSubscribeTest();
  sessionReleaseTest();
  sessionCallbackTest();
  qualityInvariantTest();
  qualityBoundaryTest();
  qualitySequenceTest();
  qualityFeatureTest();
  deviceEnumTest();
  deviceAccessTest();
  deviceRealTest();
  codeCrossTest();
  stateCrossTest();
  addressCrossTest();
  formatCrossTest();
  logCrossTest();
  catalogCrossTest();
  snapshotCrossTest();
  viewCrossTest();
  sessionCrossTest();
  featureCrossTest();
  thrownTextCrossTest();
  sessionChainTest();
  snapshotCubeTest();
  contractGridTest();
  addressGridTest();
}
