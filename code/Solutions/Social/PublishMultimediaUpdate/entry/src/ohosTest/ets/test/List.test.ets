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

import abilityContextContractTest from './ability/AbilityContextContractTest.test';
import abilityLifecycleTest from './ability/AbilityLifecycleTest.test';
import abilityWantNegativeTest from './ability/AbilityWantNegativeTest.test';
import feedSessionRestartTest from './app/FeedSessionRestartTest.test';
import feedSnapshotRestoreTest from './app/FeedSnapshotRestoreTest.test';
import publishSessionTest from './app/PublishSessionTest.test';
import listConstantsTest from './constants/ListConstantsTest.test';
import bundleExtraContractTest from './contract/BundleExtraContractTest.test';
import bundleInfoContractTest from './contract/BundleInfoContractTest.test';
import dateMathContractTest from './contract/DateMathContractTest.test';
import displayWindowContractTest from './contract/DisplayWindowContractTest.test';
import fileIoExtendedTest from './contract/FileIoExtendedTest.test';
import hilogContractTest from './contract/HilogContractTest.test';
import jsonEscapeMatrixTest from './contract/JsonEscapeMatrixTest.test';
import jsonShapeContractTest from './contract/JsonShapeContractTest.test';
import photoOptionsContractTest from './contract/PhotoOptionsContractTest.test';
import resourcePathCrossCheckTest from './contract/ResourcePathCrossCheckTest.test';
import syscapContractTest from './contract/SyscapContractTest.test';
import urlFileContractTest from './contract/UrlFileContractTest.test';
import utilMathExtraTest from './contract/UtilMathExtraTest.test';
import utilNumberFormatTest from './contract/UtilNumberFormatTest.test';
import windowAvoidAreaContractTest from './contract/WindowAvoidAreaContractTest.test';
import basicDataSourceGenericTest from './model/BasicDataSourceGenericTest.test';
import commentDataBoundaryTest from './model/CommentDataBoundaryTest.test';
import commentDataCollectionTest from './model/CommentDataCollectionTest.test';
import commentDataEmptyTextTest from './model/CommentDataEmptyTextTest.test';
import commentDataIdentityTest from './model/CommentDataIdentityTest.test';
import commentDataMixedMediaTest from './model/CommentDataMixedMediaTest.test';
import commentDataSequenceTest from './model/CommentDataSequenceTest.test';
import commentDataStressTest from './model/CommentDataStressTest.test';
import dataSourceFanoutTest from './model/DataSourceFanoutTest.test';
import dataSourceListenerLifecycleTest from './model/DataSourceListenerLifecycleTest.test';
import dataSourceNotificationTest from './model/DataSourceNotificationTest.test';
import dataSourceReentrancyTest from './model/DataSourceReentrancyTest.test';
import dataSourceRegistryTest from './model/DataSourceRegistryTest.test';
import friendMomentConstructionTest from './model/FriendMomentConstructionTest.test';
import friendMomentFieldMatrixTest from './model/FriendMomentFieldMatrixTest.test';
import friendMomentMediaRuleTest from './model/FriendMomentMediaRuleTest.test';
import friendMomentValueEqualityTest from './model/FriendMomentValueEqualityTest.test';
import mockDataContractTest from './model/MockDataContractTest.test';
import mockDataIsolationTest from './model/MockDataIsolationTest.test';
import colorFloatResourceTest from './resource/ColorFloatResourceTest.test';
import integerResourceTest from './resource/IntegerResourceTest.test';
import mediaBase64Test from './resource/MediaBase64Test.test';
import mediaDensityVariantTest from './resource/MediaDensityVariantTest.test';
import mediaResourceTest from './resource/MediaResourceTest.test';
import resourceByNameContractTest from './resource/ResourceByNameContractTest.test';
import stringResourceTest from './resource/StringResourceTest.test';
import loggerContractTest from './utils/LoggerContractTest.test';
import encodingAndRawApiTest from './contract/EncodingAndRawApiTest.test';
import alternateApiPathTest from './contract/AlternateApiPathTest.test';
import bufferCodecTest from './contract/BufferCodecTest.test';
import collectionsContractTest from './contract/CollectionsContractTest.test';
import systemClockProcessTest from './contract/SystemClockProcessTest.test';
import fileHashTest from './contract/FileHashTest.test';
import xmlBuildTest from './contract/XmlBuildTest.test';
import regexContractTest from './contract/RegexContractTest.test';
import binaryViewContractTest from './contract/BinaryViewContractTest.test';
import fileStreamIoTest from './contract/FileStreamIoTest.test';
import uriContractTest from './contract/UriContractTest.test';
import jsonTransformTest from './contract/JsonTransformTest.test';
import mapSetContractTest from './contract/MapSetContractTest.test';
import stringScanContractTest from './contract/StringScanContractTest.test';
import fileDirOpsTest from './contract/FileDirOpsTest.test';
import cryptoDigestTest from './contract/CryptoDigestTest.test';
import randomAccessIoTest from './contract/RandomAccessIoTest.test';
import deviceInfoContractTest from './contract/DeviceInfoContractTest.test';
import decoderOptionTest from './contract/DecoderOptionTest.test';
import i18nLocaleTest from './contract/I18nLocaleTest.test';
import collectionsExtendedTest from './contract/CollectionsExtendedTest.test';
import typedArrayConstructorsTest from './contract/TypedArrayConstructorsTest.test';
import arrayOpsContractTest from './contract/ArrayOpsContractTest.test';
import cryptoRandomTest from './contract/CryptoRandomTest.test';
import base64TypeTest from './contract/Base64TypeTest.test';
export default function testsuite() {
  encodingAndRawApiTest();
  alternateApiPathTest();
  bufferCodecTest();
  collectionsContractTest();
  systemClockProcessTest();
  fileHashTest();
  xmlBuildTest();
  regexContractTest();
  binaryViewContractTest();
  fileStreamIoTest();
  uriContractTest();
  jsonTransformTest();
  mapSetContractTest();
  stringScanContractTest();
  fileDirOpsTest();
  cryptoDigestTest();
  randomAccessIoTest();
  deviceInfoContractTest();
  decoderOptionTest();
  i18nLocaleTest();
  collectionsExtendedTest();
  typedArrayConstructorsTest();
  arrayOpsContractTest();
  cryptoRandomTest();
  base64TypeTest();

  abilityContextContractTest();
  abilityLifecycleTest();
  abilityWantNegativeTest();
  feedSessionRestartTest();
  feedSnapshotRestoreTest();
  publishSessionTest();
  listConstantsTest();
  bundleExtraContractTest();
  bundleInfoContractTest();
  dateMathContractTest();
  displayWindowContractTest();
  fileIoExtendedTest();
  hilogContractTest();
  jsonEscapeMatrixTest();
  jsonShapeContractTest();
  photoOptionsContractTest();
  resourcePathCrossCheckTest();
  syscapContractTest();
  urlFileContractTest();
  utilMathExtraTest();
  utilNumberFormatTest();
  windowAvoidAreaContractTest();
  basicDataSourceGenericTest();
  commentDataBoundaryTest();
  commentDataCollectionTest();
  commentDataEmptyTextTest();
  commentDataIdentityTest();
  commentDataMixedMediaTest();
  commentDataSequenceTest();
  commentDataStressTest();
  dataSourceFanoutTest();
  dataSourceListenerLifecycleTest();
  dataSourceNotificationTest();
  dataSourceReentrancyTest();
  dataSourceRegistryTest();
  friendMomentConstructionTest();
  friendMomentFieldMatrixTest();
  friendMomentMediaRuleTest();
  friendMomentValueEqualityTest();
  mockDataContractTest();
  mockDataIsolationTest();
  colorFloatResourceTest();
  integerResourceTest();
  mediaBase64Test();
  mediaDensityVariantTest();
  mediaResourceTest();
  resourceByNameContractTest();
  stringResourceTest();
  loggerContractTest();
}
