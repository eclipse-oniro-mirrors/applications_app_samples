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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
let bundleInfo: bundleManager.BundleInfo;
let appContext: common.Context;

export default function movingPhotoResourceMatrixTest() {
  describe('MovingPhotoResourceMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testResourceMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0001
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0002
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0003
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0004
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0005
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0006
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0007
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0008
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0009
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0010
     * @tc.desc   Test the packaged moving-photo image and video assets. Resource matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const image: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await appContext.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0011
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0012
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0013
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0014
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0015
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0016
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0017
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0018
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0019
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0020
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0021
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0022
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0023
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0024
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0025
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0026
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0027
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0028
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0029
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testResourceMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_RESOURCE_0030
     * @tc.desc   Test the bundle and EntryAbility contract. Resource matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })
  })
}
