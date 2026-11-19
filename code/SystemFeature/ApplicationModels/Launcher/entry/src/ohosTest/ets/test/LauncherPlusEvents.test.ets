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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { EventConstants } from '@ohos/base';

export default function launcherPlusEventsTest() {
  describe('LauncherPlusEventsTest', () => {

    /**
     * @tc.name   testLauncherPlusEvents0001
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0001
     * @tc.desc   Check launcher event constants pair 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0002
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0002
     * @tc.desc   Check launcher event constants pair 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0003
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0003
     * @tc.desc   Check launcher event constants pair 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0004
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0004
     * @tc.desc   Check launcher event constants pair 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0005
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0005
     * @tc.desc   Check launcher event constants pair 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0006
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0006
     * @tc.desc   Check launcher event constants pair 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0007
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0007
     * @tc.desc   Check launcher event constants pair 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0008
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0008
     * @tc.desc   Check launcher event constants pair 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0009
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0009
     * @tc.desc   Check launcher event constants pair 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0010
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0010
     * @tc.desc   Check launcher event constants pair 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0011
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0011
     * @tc.desc   Check launcher event constants pair 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0012
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0012
     * @tc.desc   Check launcher event constants pair 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0013
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0013
     * @tc.desc   Check launcher event constants pair 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0014
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0014
     * @tc.desc   Check launcher event constants pair 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0015
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0015
     * @tc.desc   Check launcher event constants pair 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0016
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0016
     * @tc.desc   Check launcher event constants pair 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0017
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0017
     * @tc.desc   Check launcher event constants pair 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0018
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0018
     * @tc.desc   Check launcher event constants pair 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0019
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0019
     * @tc.desc   Check launcher event constants pair 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0020
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0020
     * @tc.desc   Check launcher event constants pair 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0021
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0021
     * @tc.desc   Check launcher event constants pair 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0022
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0022
     * @tc.desc   Check launcher event constants pair 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0023
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0023
     * @tc.desc   Check launcher event constants pair 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0024
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0024
     * @tc.desc   Check launcher event constants pair 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0025
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0025
     * @tc.desc   Check launcher event constants pair 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0026
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0026
     * @tc.desc   Check launcher event constants pair 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0027
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0027
     * @tc.desc   Check launcher event constants pair 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0028
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0028
     * @tc.desc   Check launcher event constants pair 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0029
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0029
     * @tc.desc   Check launcher event constants pair 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0030
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0030
     * @tc.desc   Check launcher event constants pair 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0031
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0031
     * @tc.desc   Check launcher event constants pair 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0032
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0032
     * @tc.desc   Check launcher event constants pair 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0033
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0033
     * @tc.desc   Check launcher event constants pair 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0034
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0034
     * @tc.desc   Check launcher event constants pair 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0035
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0035
     * @tc.desc   Check launcher event constants pair 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0036
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0036
     * @tc.desc   Check launcher event constants pair 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0037
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0037
     * @tc.desc   Check launcher event constants pair 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0038
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0038
     * @tc.desc   Check launcher event constants pair 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0039
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0039
     * @tc.desc   Check launcher event constants pair 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0040
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0040
     * @tc.desc   Check launcher event constants pair 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0041
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0041
     * @tc.desc   Check launcher event constants pair 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0042
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0042
     * @tc.desc   Check launcher event constants pair 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0043
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0043
     * @tc.desc   Check launcher event constants pair 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0044
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0044
     * @tc.desc   Check launcher event constants pair 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0045
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0045
     * @tc.desc   Check launcher event constants pair 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0046
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0046
     * @tc.desc   Check launcher event constants pair 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0047
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0047
     * @tc.desc   Check launcher event constants pair 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0048
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0048
     * @tc.desc   Check launcher event constants pair 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0049
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0049
     * @tc.desc   Check launcher event constants pair 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0050
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0050
     * @tc.desc   Check launcher event constants pair 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0051
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0051
     * @tc.desc   Check launcher event constants pair 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0052
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0052
     * @tc.desc   Check launcher event constants pair 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0053
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0053
     * @tc.desc   Check launcher event constants pair 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0054
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0054
     * @tc.desc   Check launcher event constants pair 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_RECENTS === EventConstants.EVENT_ENTER_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0055
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0055
     * @tc.desc   Check launcher event constants pair 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_CLEAR_RECENTS.length > 0).assertTrue();
      expect(EventConstants.EVENT_CLEAR_RECENTS === EventConstants.EVENT_CLEAR_RECENTS).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0056
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0056
     * @tc.desc   Check launcher event constants pair 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER === EventConstants.EVENT_ENTER_FORM_MANAGER).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0057
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0057
     * @tc.desc   Check launcher event constants pair 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_PACKAGE_ADDED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_ADDED === EventConstants.EVENT_PACKAGE_ADDED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0058
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0058
     * @tc.desc   Check launcher event constants pair 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_PACKAGE_REMOVED.length > 0).assertTrue();
      expect(EventConstants.EVENT_PACKAGE_REMOVED === EventConstants.EVENT_PACKAGE_REMOVED).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0059
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0059
     * @tc.desc   Check launcher event constants pair 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_BADGE_UPDATE.length > 0).assertTrue();
      expect(EventConstants.EVENT_BADGE_UPDATE === EventConstants.EVENT_BADGE_UPDATE).assertTrue();
    })

    /**
     * @tc.name   testLauncherPlusEvents0060
     * @tc.number SUB_LAUNCHER_PLUS_EVENTS_0060
     * @tc.desc   Check launcher event constants pair 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEvents0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_ENTER_HOME.length > 0).assertTrue();
      expect(EventConstants.EVENT_ENTER_HOME === EventConstants.EVENT_ENTER_HOME).assertTrue();
    })
  })
}
