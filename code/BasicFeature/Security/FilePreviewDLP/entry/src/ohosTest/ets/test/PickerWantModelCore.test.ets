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
import { picker } from '@kit.CoreFileKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF812;
const TAG: string = 'PickerWantModelCoreTest';
const VIEW_DATA_ACTION: string = 'ohos.want.action.viewData';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function pickerWantModelCoreTest(): void {
  describe('PickerWantModelCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0401
     * @tc.name      testPickerWant0401
     * @tc.desc      Verify DocumentSelectOptions can be constructed headless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0401 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue options !== null=${options !== null}`);
      expect(options !== null).assertTrue();
      log('testPickerWant0401 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0402
     * @tc.name      testPickerWant0402
     * @tc.desc      Verify DocumentSelectOptions is an object instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0402 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof options=${typeof options}, expected='object'`);
      expect(typeof options).assertEqual('object');
      log('testPickerWant0402 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0403
     * @tc.name      testPickerWant0403
     * @tc.desc      Verify maxSelectNumber accepts the showcase value three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0403 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 3;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.maxSelectNumber=${options.maxSelectNumber}`);
      expect(options.maxSelectNumber).assertEqual(3);
      log('testPickerWant0403 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0404
     * @tc.name      testPickerWant0404
     * @tc.desc      Verify assigned maxSelectNumber keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0404 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 3;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof options.maxSelectNumber}, expected='number'`);
      expect(typeof options.maxSelectNumber).assertEqual('number');
      log('testPickerWant0404 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0405
     * @tc.name      testPickerWant0405
     * @tc.desc      Verify maxSelectNumber accepts zero as a boundary value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0405 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.maxSelectNumber=${options.maxSelectNumber}`);
      expect(options.maxSelectNumber).assertEqual(0);
      log('testPickerWant0405 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0406
     * @tc.name      testPickerWant0406
     * @tc.desc      Verify maxSelectNumber accepts one as a boundary value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0406 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.maxSelectNumber=${options.maxSelectNumber}`);
      expect(options.maxSelectNumber).assertEqual(1);
      log('testPickerWant0406 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0407
     * @tc.name      testPickerWant0407
     * @tc.desc      Verify maxSelectNumber accepts the documented default bound 500.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0407 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 500;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.maxSelectNumber=${options.maxSelectNumber}`);
      expect(options.maxSelectNumber).assertEqual(500);
      log('testPickerWant0407 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0408
     * @tc.name      testPickerWant0408
     * @tc.desc      Verify maxSelectNumber accepts a large value without validation error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0408 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 1000;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.maxSelectNumber=${options.maxSelectNumber}`);
      expect(options.maxSelectNumber).assertEqual(1000);
      log('testPickerWant0408 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0409
     * @tc.name      testPickerWant0409
     * @tc.desc      Verify defaultFilePathUri accepts and returns a uri string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0409 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.defaultFilePathUri = 'file://docs/storage';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual options.defaultFilePathUri=${options.defaultFilePathUri}`);
      expect(options.defaultFilePathUri).assertEqual('file://docs/storage');
      log('testPickerWant0409 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0410
     * @tc.name      testPickerWant0410
     * @tc.desc      Verify assigned defaultFilePathUri keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0410 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.defaultFilePathUri = 'file://docs/storage';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof options.defaultFilePathUri}`);
      expect(typeof options.defaultFilePathUri).assertEqual('string');
      log('testPickerWant0410 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0411
     * @tc.name      testPickerWant0411
     * @tc.desc      Verify fileSuffixFilters accepts a single dlp suffix filter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0411 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      const filters: Array<string> = ['.dlp'];
      options.fileSuffixFilters = filters;
      const readBack: Array<string> = options.fileSuffixFilters as Array<string>;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBack.length=${readBack.length}, expected=1`);
      expect(readBack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBack[0]=${readBack[0]}, expected='.dlp'`);
      expect(readBack[0]).assertEqual('.dlp');
      log('testPickerWant0411 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0412
     * @tc.name      testPickerWant0412
     * @tc.desc      Verify fileSuffixFilters accepts multiple suffix filters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0412 begin');
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      const filters: Array<string> = ['.dlp', '.doc', '.pdf'];
      options.fileSuffixFilters = filters;
      const readBack: Array<string> = options.fileSuffixFilters as Array<string>;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBack.length=${readBack.length}, expected=3`);
      expect(readBack.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBack[2]=${readBack[2]}, expected='.pdf'`);
      expect(readBack[2]).assertEqual('.pdf');
      log('testPickerWant0412 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0413
     * @tc.name      testPickerWant0413
     * @tc.desc      Verify DocumentViewPicker supports headless no-arg construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0413 begin');
      const docPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue docPicker !== null=${docPicker !== null}`);
      expect(docPicker !== null).assertTrue();
      log('testPickerWant0413 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0414
     * @tc.name      testPickerWant0414
     * @tc.desc      Verify DocumentViewPicker instance is an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0414 begin');
      const docPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof docPicker=${typeof docPicker}, expected='object'`);
      expect(typeof docPicker).assertEqual('object');
      log('testPickerWant0414 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0415
     * @tc.name      testPickerWant0415
     * @tc.desc      Verify DocumentViewPicker exposes a callable select method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0415 begin');
      const docPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof docPicker.select=${typeof docPicker.select}`);
      expect(typeof docPicker.select).assertEqual('function');
      log('testPickerWant0415 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0416
     * @tc.name      testPickerWant0416
     * @tc.desc      Verify a picker returned file uri can ride the want uri field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0416 begin');
      const uri: string = 'file://docs/storage/sample.dlp';
      const want: Want = { 'uri': uri };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.uri=${want.uri}, expected=uri`);
      expect(want.uri).assertEqual(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue uri.startsWith('file://')`);
      expect(uri.startsWith('file://')).assertTrue();
      log('testPickerWant0416 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0417
     * @tc.name      testPickerWant0417
     * @tc.desc      Verify a view want can carry the showcase action string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0417 begin');
      const want: Want = { 'action': VIEW_DATA_ACTION };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.action=${want.action}, expected=VIEW_DATA_ACTION`);
      expect(want.action).assertEqual(VIEW_DATA_ACTION);
      log('testPickerWant0417 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0418
     * @tc.name      testPickerWant0418
     * @tc.desc      Verify a view want can carry action and uri together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0418 begin');
      const want: Want = { 'action': VIEW_DATA_ACTION, 'uri': 'file://docs/storage/sample.dlp' };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.action=${want.action}, expected=VIEW_DATA_ACTION`);
      expect(want.action).assertEqual(VIEW_DATA_ACTION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.uri=${want.uri}`);
      expect(want.uri).assertEqual('file://docs/storage/sample.dlp');
      log('testPickerWant0418 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0419
     * @tc.name      testPickerWant0419
     * @tc.desc      Verify the want action field keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0419 begin');
      const want: Want = { 'action': VIEW_DATA_ACTION };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof want.action=${typeof want.action}, expected='string'`);
      expect(typeof want.action).assertEqual('string');
      log('testPickerWant0419 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0420
     * @tc.name      testPickerWant0420
     * @tc.desc      Verify the want uri field keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0420 begin');
      const want: Want = { 'uri': 'file://docs/storage/sample.dlp' };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof want.uri=${typeof want.uri}, expected='string'`);
      expect(typeof want.uri).assertEqual('string');
      log('testPickerWant0420 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0421
     * @tc.name      testPickerWant0421
     * @tc.desc      Verify a file scheme uri round trips through the want model.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0421 begin');
      const want: Want = { 'uri': 'file://com.samples.filepreviewdlp/data/test.dlp' };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.uri=${want.uri}`);
      expect(want.uri).assertEqual('file://com.samples.filepreviewdlp/data/test.dlp');
      log('testPickerWant0421 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_PKWM_0422
     * @tc.name      testPickerWant0422
     * @tc.desc      Verify a datashare scheme uri round trips through the want model.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPickerWant0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPickerWant0422 begin');
      const want: Want = { 'uri': 'datashare:///media/file/100' };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual want.uri=${want.uri}, expected='datashare:///media/file/100'`);
      expect(want.uri).assertEqual('datashare:///media/file/100');
      log('testPickerWant0422 end');
    })
  })
}
