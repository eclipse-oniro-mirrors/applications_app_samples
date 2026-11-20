/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import abilityTest from './cases/Ability.test'
import abilityLifecycleTest from './cases/AbilityLifecycleTest.test'
import pageLayoutTest from './cases/PageLayoutTest.test'
import animationSelectTest from './cases/AnimationSelectTest.test'
import playbackControlTest from './cases/PlaybackControlTest.test'
import speedDirectionTest from './cases/SpeedDirectionTest.test'
import segmentControlTest from './cases/SegmentControlTest.test'
import playbackPositionTest from './cases/PlaybackPositionTest.test'
import eventListenTest from './cases/EventListenTest.test'
import tabsNavigationTest from './cases/TabsNavigationTest.test'
import resourceStringTest from './cases/ResourceStringTest.test'
import resourceMediaTest from './cases/ResourceMediaTest.test'
import bundleConfigTest from './cases/BundleConfigTest.test'
import displayWindowTest from './cases/DisplayWindowTest.test'
import loggerTest from './cases/LoggerTest.test'
import performanceTest from './cases/PerformanceTest.test'
import errorHandlingTest from './cases/ErrorHandlingTest.test'
import extendedCoverageTest from './cases/ExtendedCoverageTest.test'
import windowStateTest from './cases/WindowStateTest.test'
import deviceInfoTest from './cases/DeviceInfoTest.test'
import i18nSystemTest from './cases/I18nSystemTest.test'
import runtimeUtilTest from './cases/RuntimeUtilTest.test'
import uriParseTest from './cases/UriParseTest.test'
import utilCollectionsTest from './cases/UtilCollectionsTest.test'
import utilContainersTest from './cases/UtilContainersTest.test'
import utilLightWeightSetTest from './cases/UtilLightWeightSetTest.test'
import bufferApiTest from './cases/BufferApiTest.test'
import urlApiTest from './cases/UrlApiTest.test'
import urlParamsTest from './cases/UrlParamsTest.test'
import fileIoTest from './cases/FileIoTest.test'
import bundleExtraTest from './cases/BundleExtraTest.test'
import errorMatrixTest from './cases/ErrorMatrixTest.test'

export default function testsuite() {
  // Launch and lifecycle, then the page structure and interaction suites.
  abilityTest()
  abilityLifecycleTest()
  extendedCoverageTest()
  pageLayoutTest()
  animationSelectTest()
  playbackControlTest()
  speedDirectionTest()
  // Installed resource, manifest, display and window contracts.
  resourceStringTest()
  resourceMediaTest()
  bundleConfigTest()
  displayWindowTest()
  windowStateTest()
  // Device, locale and runtime helpers used by the page.
  deviceInfoTest()
  i18nSystemTest()
  runtimeUtilTest()
  uriParseTest()
  utilCollectionsTest()
  utilContainersTest()
  utilLightWeightSetTest()
  bufferApiTest()
  urlApiTest()
  urlParamsTest()
  fileIoTest()
  bundleExtraTest()
  errorMatrixTest()
  // Cross-cutting utilities and final robustness probes.
  loggerTest()
  errorHandlingTest()
  performanceTest()
  // Tab-heavy suites run last: they leave the page scrolled to the bottom.
  segmentControlTest()
  playbackPositionTest()
  eventListenTest()
  tabsNavigationTest()
}
