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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { common } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'ResourceContractCoreTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function getResourceManager(): resourceManager.ResourceManager {
  const appContext: common.Context = delegator.getAppContext();
  return appContext.resourceManager;
}

export default function resourceContractCoreTest(): void {
  describe('ResourceContractCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0201
     * @tc.name      testResourceRes0201
     * @tc.desc      Verify module_desc string resolves to its documented value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0201 begin');
      const value: string = getResourceManager().getStringByNameSync('module_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='module description'`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0201 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0202
     * @tc.name      testResourceRes0202
     * @tc.desc      Verify EntryAbility_desc string resolves to its documented value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0202 begin');
      const value: string = getResourceManager().getStringByNameSync('EntryAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='description'`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0202 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0203
     * @tc.name      testResourceRes0203
     * @tc.desc      Verify EntryAbility_label string resolves to FilePreviewDLP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0203 begin');
      const value: string = getResourceManager().getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='FilePreviewDLP'`);
      expect(value).assertEqual('FilePreviewDLP');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0203 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0204
     * @tc.name      testResourceRes0204
     * @tc.desc      Verify the page title string resolves to the DLP showcase text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0204 begin');
      const value: string = getResourceManager().getStringByNameSync('file_preview_dlp_text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='DLP文件添加展示'`);
      expect(value).assertEqual('DLP文件添加展示');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0204 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0205
     * @tc.name      testResourceRes0205
     * @tc.desc      Verify the hundred percent layout string resolves to 100%.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0205 begin');
      const value: string = getResourceManager().getStringByNameSync('file_preview_dlp_hundred_percent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='100%'`);
      expect(value).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0205 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0206
     * @tc.name      testResourceRes0206
     * @tc.desc      Verify the filter toast string resolves to its documented text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0206 begin');
      const value: string = getResourceManager().getStringByNameSync('file_preview_dlp_show_ui');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='此样式仅为案例展示'`);
      expect(value).assertEqual('此样式仅为案例展示');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0206 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0207
     * @tc.name      testResourceRes0207
     * @tc.desc      Verify the file item hint string resolves to its documented text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0207 begin');
      const value: string = getResourceManager().getStringByNameSync('file_preview_dlp_show_text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='点击跳转文件预览展示DLP文件'`);
      expect(value).assertEqual('点击跳转文件预览展示DLP文件');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0207 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0208
     * @tc.name      testResourceRes0208
     * @tc.desc      Verify the app level name string resolves to FilePreviewDLP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0208 begin');
      const value: string = getResourceManager().getStringByNameSync('app_name');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='FilePreviewDLP'`);
      expect(value).assertEqual('FilePreviewDLP');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testResourceRes0208 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0209
     * @tc.name      testResourceRes0209
     * @tc.desc      Verify integer_28 resource resolves to 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0209 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_28');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=28`);
      expect(value).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0209 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0210
     * @tc.name      testResourceRes0210
     * @tc.desc      Verify integer_20 resource resolves to 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0210 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_20');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=20`);
      expect(value).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0210 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0211
     * @tc.name      testResourceRes0211
     * @tc.desc      Verify integer_400 resource resolves to 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0211 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_400');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=400`);
      expect(value).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0211 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0212
     * @tc.name      testResourceRes0212
     * @tc.desc      Verify integer_69 resource resolves to 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0212 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_69');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=69`);
      expect(value).assertEqual(69);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0212 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0213
     * @tc.name      testResourceRes0213
     * @tc.desc      Verify integer_15 resource resolves to 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0213 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_15');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=15`);
      expect(value).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0213 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0214
     * @tc.name      testResourceRes0214
     * @tc.desc      Verify integer_24 resource resolves to 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0214 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_24');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=24`);
      expect(value).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0214 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0215
     * @tc.name      testResourceRes0215
     * @tc.desc      Verify integer_50 resource resolves to 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0215 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_50');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=50`);
      expect(value).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0215 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0216
     * @tc.name      testResourceRes0216
     * @tc.desc      Verify integer_21 resource resolves to 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0216 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_21');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=21`);
      expect(value).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0216 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0217
     * @tc.name      testResourceRes0217
     * @tc.desc      Verify integer_13 resource resolves to 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0217 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_13');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=13`);
      expect(value).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0217 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0218
     * @tc.name      testResourceRes0218
     * @tc.desc      Verify integer_10 resource resolves to 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0218 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_10');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=10`);
      expect(value).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0218 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0219
     * @tc.name      testResourceRes0219
     * @tc.desc      Verify integer_46 resource resolves to 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0219 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_46');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=46`);
      expect(value).assertEqual(46);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0219 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0220
     * @tc.name      testResourceRes0220
     * @tc.desc      Verify integer_12 resource resolves to 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0220 begin');
      const value: number = getResourceManager().getNumberByName('file_preview_dlp_integer_12');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=12`);
      expect(value).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testResourceRes0220 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0223
     * @tc.name      testResourceRes0223
     * @tc.desc      Verify the add icon media resource resolves to non empty bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0223 begin');
      const content: Uint8Array = getResourceManager().getMediaContentSync($r('app.media.file_preview_dlp_add'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content !== null=${content !== null}`);
      expect(content !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content.length > 0=${content.length > 0}`);
      expect(content.length > 0).assertTrue();
      log('testResourceRes0223 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0224
     * @tc.name      testResourceRes0224
     * @tc.desc      Verify the sift icon media resource resolves to non empty bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0224 begin');
      const content: Uint8Array = getResourceManager().getMediaContentSync($r('app.media.file_preview_dlp_sift'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content !== null=${content !== null}`);
      expect(content !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content.length > 0=${content.length > 0}`);
      expect(content.length > 0).assertTrue();
      log('testResourceRes0224 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0225
     * @tc.name      testResourceRes0225
     * @tc.desc      Verify the word icon media resource resolves to non empty bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0225 begin');
      const content: Uint8Array = getResourceManager().getMediaContentSync($r('app.media.file_preview_dlp_word'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content !== null=${content !== null}`);
      expect(content !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue content.length > 0=${content.length > 0}`);
      expect(content.length > 0).assertTrue();
      log('testResourceRes0225 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_RESC_0226
     * @tc.name      testResourceRes0226
     * @tc.desc      Verify resolving an unknown string name throws an error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceRes0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResourceRes0226 begin');
      let caught: boolean = false;
      try {
        getResourceManager().getStringByNameSync('no_such_resource_name_xyz');
      } catch (error) {
        caught = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue caught=${caught}`);
      expect(caught).assertTrue();
      log('testResourceRes0226 end');
    })
  })
}
