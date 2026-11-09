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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { ResManager } from 'library';

const BUNDLE_NAME: string = 'com.samples.hspsample';
let libraryContext: common.Context;
let libraryResourceManager: resourceManager.ResourceManager;

export default function hspResourceResolutionTest(): void {
  describe('HspResourceResolutionTest', () => {
    beforeAll(async () => {
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      libraryContext = appContext.createModuleContext('library');
      libraryResourceManager = libraryContext.resourceManager;
    });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0100
     * @tc.name      testHspResourceResolve0001
     * @tc.desc      Verify the shared description resolves through the HSP module context.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const desc: Resource = ResManager.getDesc();
          const asyncValue: string = await libraryResourceManager.getStringValue(desc);
          const byName: string = libraryResourceManager.getStringByNameSync('shared_desc');
          expect(asyncValue).assertEqual(byName);
          expect(asyncValue.length > 0).assertTrue();
          expect(asyncValue === 'shared_desc').assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0200
     * @tc.name      testHspResourceResolve0002
     * @tc.desc      Verify synchronous description resolution agrees with lookup by resource name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const desc: Resource = ResManager.getDesc();
          const syncValue: string = libraryResourceManager.getStringSync(desc);
          const byName: string = libraryResourceManager.getStringByNameSync('shared_desc');
          expect(syncValue).assertEqual(byName);
          expect(syncValue.length > 0).assertTrue();
          expect(syncValue === '').assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0300
     * @tc.name      testHspResourceResolve0003
     * @tc.desc      Verify the description resource identifies the library module and sample bundle.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const desc: Resource = ResManager.getDesc();
          expect(desc.id > 0).assertTrue();
          expect(String(desc.moduleName)).assertEqual('library');
          expect(String(desc.bundleName)).assertEqual(BUNDLE_NAME);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0400
     * @tc.name      testHspResourceResolve0004
     * @tc.desc      Verify repeated picture lookups return the same identifier and differ from the description.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const firstPicture: Resource = ResManager.getPic();
          const secondPicture: Resource = ResManager.getPic();
          const desc: Resource = ResManager.getDesc();
          expect(firstPicture.id).assertEqual(secondPicture.id);
          expect(firstPicture.id === desc.id).assertFalse();
          expect(String(firstPicture.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0500
     * @tc.name      testHspResourceResolve0005
     * @tc.desc      Verify the HSP picture resolves to PNG bytes through the module resource manager.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const picture: Resource = ResManager.getPic();
          const bytes: Uint8Array = libraryResourceManager.getMediaContentSync(picture);
          expect(bytes.length > 1000).assertTrue();
          expect(bytes[0]).assertEqual(0x89);
          expect(bytes[1]).assertEqual(0x50);
          expect(bytes[2]).assertEqual(0x4E);
          expect(bytes[3]).assertEqual(0x47);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0600
     * @tc.name      testHspResourceResolve0006
     * @tc.desc      Verify asynchronous picture reading returns the same PNG payload as synchronous reading.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const picture: Resource = ResManager.getPic();
          const syncBytes: Uint8Array = libraryResourceManager.getMediaContentSync(picture);
          const asyncBytes: Uint8Array = await libraryResourceManager.getMediaContent(picture);
          let headerMatches: boolean = true;
          for (let index = 0; index < 8; index++) {
            if (asyncBytes[index] !== syncBytes[index]) {
              headerMatches = false;
            }
          }
          expect(asyncBytes.length).assertEqual(syncBytes.length);
          expect(asyncBytes.length > 1000).assertTrue();
          expect(headerMatches).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0700
     * @tc.name      testHspResourceResolve0007
     * @tc.desc      Verify picture lookup by name matches the exported picture resource.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const picture: Resource = ResManager.getPic();
          const byName: Uint8Array = libraryResourceManager.getMediaByNameSync('pic');
          const byResource: Uint8Array = libraryResourceManager.getMediaContentSync(picture);
          expect(byName.length).assertEqual(byResource.length);
          expect(byName[0]).assertEqual(0x89);
          expect(byName[1]).assertEqual(0x50);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_RESOLVE_0800
     * @tc.name      testHspResourceResolve0008
     * @tc.desc      Verify the picture can be decoded into a drawable with non-zero dimensions.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceResolve0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const picture: Resource = ResManager.getPic();
          const descriptor = libraryResourceManager.getDrawableDescriptor(picture);
          const pixelMap = descriptor.getPixelMap();
          const imageInfo = await pixelMap.getImageInfo();
          expect(descriptor !== undefined).assertTrue();
          expect(imageInfo.size.width > 0).assertTrue();
          expect(imageInfo.size.height > 0).assertTrue();
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
