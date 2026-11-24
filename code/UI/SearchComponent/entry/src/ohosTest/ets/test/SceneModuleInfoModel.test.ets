/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { SceneModuleInfo } from 'searchcomponent/src/main/ets/components/model/SceneModuleInfo';

const DOMAIN: number = 0xF814;
const TAG: string = 'SceneModuleInfoModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function sceneModuleInfoModelTest(): void {
  describe('SceneModuleInfoModelTest', () => {
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0001
     * @tc.name      testSceneModelInfo0001
     * @tc.desc      Verify optional constructor fields fall back to defaults.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0001 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('默认构造', 'demo/DemoPage', 'UI布局', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected=''`);
      expect(item.param).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.ratingNumber=${item.ratingNumber}, expected=2`);
      expect(item.ratingNumber).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.helperUrl=${item.helperUrl}, expected=''`);
      expect(item.helperUrl).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (item.swiperImage as string)=${(item.swiperImage as string)}`);
      expect((item.swiperImage as string)).assertEqual('');
      log('testSceneModelInfo0001 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0002
     * @tc.name      testSceneModelInfo0002
     * @tc.desc      Verify a fully customized constructor keeps every field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0002 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('全字段', 'demo/DemoView', '动效', 7, 4, 'demo/image',
        'routeParam', 'helper/url');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='全字段'`);
      expect(item.name).assertEqual('全字段');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.appUri=${item.appUri}, expected='demo/DemoView'`);
      expect(item.appUri).assertEqual('demo/DemoView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='动效'`);
      expect(item.category).assertEqual('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.serialNumber=${item.serialNumber}, expected=7`);
      expect(item.serialNumber).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.ratingNumber=${item.ratingNumber}, expected=4`);
      expect(item.ratingNumber).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected='routeParam'`);
      expect(item.param).assertEqual('routeParam');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.helperUrl=${item.helperUrl}, expected='helper/url'`);
      expect(item.helperUrl).assertEqual('helper/url');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (item.swiperImage as string)=${(item.swiperImage as string)}`);
      expect((item.swiperImage as string)).assertEqual('demo/image');
      log('testSceneModelInfo0002 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0003
     * @tc.name      testSceneModelInfo0003
     * @tc.desc      Verify an explicit rating number overrides the default two stars.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0003 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('五星', 'demo/DemoPage', '动效', 5, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.ratingNumber=${item.ratingNumber}, expected=5`);
      expect(item.ratingNumber).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected=''`);
      expect(item.param).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.helperUrl=${item.helperUrl}, expected=''`);
      expect(item.helperUrl).assertEqual('');
      log('testSceneModelInfo0003 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0004
     * @tc.name      testSceneModelInfo0004
     * @tc.desc      Verify an explicit swiper image is stored and rating stays custom.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0004 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('轮播图', 'demo/DemoPage', 'UI布局', 9, 3, 'demo/swiper');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (item.swiperImage as string)=${(item.swiperImage as string)}`);
      expect((item.swiperImage as string)).assertEqual('demo/swiper');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.ratingNumber=${item.ratingNumber}, expected=3`);
      expect(item.ratingNumber).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected=''`);
      expect(item.param).assertEqual('');
      log('testSceneModelInfo0004 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0005
     * @tc.name      testSceneModelInfo0005
     * @tc.desc      Verify an explicit route param is stored while helper url defaults.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0005 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('传参', 'demo/DemoPage', 'UI布局', 10, 1, 'demo/img', 'p1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected='p1'`);
      expect(item.param).assertEqual('p1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.helperUrl=${item.helperUrl}, expected=''`);
      expect(item.helperUrl).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.ratingNumber=${item.ratingNumber}, expected=1`);
      expect(item.ratingNumber).assertEqual(1);
      log('testSceneModelInfo0005 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0006
     * @tc.name      testSceneModelInfo0006
     * @tc.desc      Verify helper url field accepts an explicit value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0006 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('文档', 'demo/DemoPage', '其他', 11, 2, 'img', 'p',
        'https://readme');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.helperUrl=${item.helperUrl}, expected='https://readme'`);
      expect(item.helperUrl).assertEqual('https://readme');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.param=${item.param}, expected='p'`);
      expect(item.param).assertEqual('p');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.serialNumber=${item.serialNumber}, expected=11`);
      expect(item.serialNumber).assertEqual(11);
      log('testSceneModelInfo0006 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0007
     * @tc.name      testSceneModelInfo0007
     * @tc.desc      Verify the name field is mutable and reads back the new value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0007 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('旧名称', 'demo/DemoPage', 'UI布局', 12);
      item.name = '新名称';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='新名称'`);
      expect(item.name).assertEqual('新名称');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name.length=${item.name.length}, expected=3`);
      expect(item.name.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.serialNumber=${item.serialNumber}, expected=12`);
      expect(item.serialNumber).assertEqual(12);
      log('testSceneModelInfo0007 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0008
     * @tc.name      testSceneModelInfo0008
     * @tc.desc      Verify the appUri field is mutable and keeps the route format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0008 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('路由', 'old/OldPage', 'UI布局', 13);
      item.appUri = 'new/NewPage';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.appUri=${item.appUri}, expected='new/NewPage'`);
      expect(item.appUri).assertEqual('new/NewPage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item.appUri.includes('/')=${item.appUri.includes('/')}`);
      expect(item.appUri.includes('/')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='UI布局'`);
      expect(item.category).assertEqual('UI布局');
      log('testSceneModelInfo0008 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0009
     * @tc.name      testSceneModelInfo0009
     * @tc.desc      Verify the category field is mutable between valid groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0009 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('分类', 'demo/DemoPage', 'UI布局', 14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='UI布局'`);
      expect(item.category).assertEqual('UI布局');
      item.category = '动效';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='动效'`);
      expect(item.category).assertEqual('动效');
      item.category = 'Native';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='Native'`);
      expect(item.category).assertEqual('Native');
      log('testSceneModelInfo0009 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0010
     * @tc.name      testSceneModelInfo0010
     * @tc.desc      Verify the serial number field is mutable and stays a number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0010 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('序号', 'demo/DemoPage', 'UI布局', 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.serialNumber=${typeof item.serialNumber}`);
      expect(typeof item.serialNumber).assertEqual('number');
      item.serialNumber = 99;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.serialNumber=${item.serialNumber}, expected=99`);
      expect(item.serialNumber).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.serialNumber.toString()=${item.serialNumber.toString()}`);
      expect(item.serialNumber.toString()).assertEqual('99');
      log('testSceneModelInfo0010 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0011
     * @tc.name      testSceneModelInfo0011
     * @tc.desc      Verify Chinese sample names are stored without any change.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0011 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('发布图片评论', 'imagecomment/ImageCommentView', 'UI布局', 29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name=${item.name}, expected='发布图片评论'`);
      expect(item.name).assertEqual('发布图片评论');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name.length=${item.name.length}, expected=6`);
      expect(item.name.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='UI布局'`);
      expect(item.category).assertEqual('UI布局');
      log('testSceneModelInfo0011 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0012
     * @tc.name      testSceneModelInfo0012
     * @tc.desc      Verify mixed case route strings survive the constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0012 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('路由样式', 'xcomponentvsync/XcomponentVsync_v2', 'Native', 97);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.appUri=${item.appUri}`);
      expect(item.appUri).assertEqual('xcomponentvsync/XcomponentVsync_v2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item.appUri.includes('Vsync')}`);
      expect(item.appUri.includes('Vsync')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.category=${item.category}, expected='Native'`);
      expect(item.category).assertEqual('Native');
      log('testSceneModelInfo0012 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0013
     * @tc.name      testSceneModelInfo0013
     * @tc.desc      Verify serial number accepts boundary values without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0013 begin');
      const zero: SceneModuleInfo = new SceneModuleInfo('零号', 'demo/A', '其他', 0);
      const negative: SceneModuleInfo = new SceneModuleInfo('负号', 'demo/B', '其他', -5);
      const maxSafe: SceneModuleInfo = new SceneModuleInfo('极大', 'demo/C', '其他', 9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual zero.serialNumber=${zero.serialNumber}, expected=0`);
      expect(zero.serialNumber).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual negative.serialNumber=${negative.serialNumber}, expected=-5`);
      expect(negative.serialNumber).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual maxSafe.serialNumber=${maxSafe.serialNumber}`);
      expect(maxSafe.serialNumber).assertEqual(9007199254740991);
      log('testSceneModelInfo0013 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0014
     * @tc.name      testSceneModelInfo0014
     * @tc.desc      Verify two instances do not share mutable field state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0014 begin');
      const first: SceneModuleInfo = new SceneModuleInfo('实例一', 'demo/A', 'UI布局', 30);
      const second: SceneModuleInfo = new SceneModuleInfo('实例二', 'demo/B', '动效', 31);
      first.name = '已改名';
      first.serialNumber = 100;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.name=${second.name}, expected='实例二'`);
      expect(second.name).assertEqual('实例二');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.serialNumber=${second.serialNumber}, expected=31`);
      expect(second.serialNumber).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.name=${first.name}, expected='已改名'`);
      expect(first.name).assertEqual('已改名');
      log('testSceneModelInfo0014 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0015
     * @tc.name      testSceneModelInfo0015
     * @tc.desc      Verify a long sample name keeps its full length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0015 begin');
      let longName: string = '';
      for (let i: number = 0; i < 300; i++) {
        longName += '例';
      }
      const item: SceneModuleInfo = new SceneModuleInfo(longName, 'demo/Long', '其他', 40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name.length=${item.name.length}, expected=300`);
      expect(item.name.length).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.name.substring(0, 1)=${item.name.substring(0, 1)}`);
      expect(item.name.substring(0, 1)).assertEqual('例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.appUri=${item.appUri}, expected='demo/Long'`);
      expect(item.appUri).assertEqual('demo/Long');
      log('testSceneModelInfo0015 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_MODEL_0016
     * @tc.name      testSceneModelInfo0016
     * @tc.desc      Verify runtime types of core fields after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSceneModelInfo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSceneModelInfo0016 begin');
      const item: SceneModuleInfo = new SceneModuleInfo('类型', 'demo/Type', '其他', 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof SceneModuleInfo}`);
      expect(item instanceof SceneModuleInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.name=${typeof item.name}, expected='string'`);
      expect(typeof item.name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.appUri=${typeof item.appUri}, expected='string'`);
      expect(typeof item.appUri).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.category=${typeof item.category}`);
      expect(typeof item.category).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.serialNumber=${typeof item.serialNumber}`);
      expect(typeof item.serialNumber).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.ratingNumber=${typeof item.ratingNumber}`);
      expect(typeof item.ratingNumber).assertEqual('number');
      log('testSceneModelInfo0016 end');
    })
  })
}
