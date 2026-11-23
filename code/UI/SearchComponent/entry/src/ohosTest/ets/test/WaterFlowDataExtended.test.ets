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
import { waterFlowData } from 'searchcomponent/src/main/ets/components/data/WaterFlowData';

const DOMAIN: number = 0xF814;
const TAG: string = 'WaterFlowDataExtendedTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function findByName(name: string): SceneModuleInfo | undefined {
  return waterFlowData.find((item: SceneModuleInfo) => item.name === name);
}

export default function waterFlowDataExtendedTest(): void {
  describe('WaterFlowDataExtendedTest', () => {
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0201
     * @tc.name      testWaterFlowDataExt0201
     * @tc.desc      Verify the address exchange sample fields and two star rating.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0201 begin');
      const item: SceneModuleInfo | undefined = findByName('地址交换动画');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=1`);
      expect(target.serialNumber).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='动效'`);
      expect(target.category).assertEqual('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('addressexchange/AddressExchangeView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=2`);
      expect(target.ratingNumber).assertEqual(2);
      log('testWaterFlowDataExt0201 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0202
     * @tc.name      testWaterFlowDataExt0202
     * @tc.desc      Verify the modal login sample uses default rating fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0202 begin');
      const item: SceneModuleInfo | undefined = findByName('全屏登录页面');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=3`);
      expect(target.serialNumber).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='UI布局'`);
      expect(target.category).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('modalwindow/ModalWindow');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=2`);
      expect(target.ratingNumber).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.param=${target.param}, expected=''`);
      expect(target.param).assertEqual('');
      log('testWaterFlowDataExt0202 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0203
     * @tc.name      testWaterFlowDataExt0203
     * @tc.desc      Verify the secondary linkage sample routes to its component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0203 begin');
      const item: SceneModuleInfo | undefined = findByName('列表二级联动');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=9`);
      expect(target.serialNumber).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='UI布局'`);
      expect(target.category).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('secondarylinkage/SecondaryLinkComponent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=1`);
      expect(target.ratingNumber).assertEqual(1);
      log('testWaterFlowDataExt0203 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0204
     * @tc.name      testWaterFlowDataExt0204
     * @tc.desc      Verify the image comment sample used by manual test flows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0204 begin');
      const item: SceneModuleInfo | undefined = findByName('发布图片评论');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=29`);
      expect(target.serialNumber).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='UI布局'`);
      expect(target.category).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('imagecomment/ImageCommentView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=2`);
      expect(target.ratingNumber).assertEqual(2);
      log('testWaterFlowDataExt0204 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0205
     * @tc.name      testWaterFlowDataExt0205
     * @tc.desc      Verify the GBK decoding sample keeps its category and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0205 begin');
      const item: SceneModuleInfo | undefined = findByName('GBK文本格式解码');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=12`);
      expect(target.serialNumber).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='其他'`);
      expect(target.category).assertEqual('其他');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('gbktranscoding/FriendsBook');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=2`);
      expect(target.ratingNumber).assertEqual(2);
      log('testWaterFlowDataExt0205 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0206
     * @tc.name      testWaterFlowDataExt0206
     * @tc.desc      Verify the verify code sample carries a three star rating.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0206 begin');
      const item: SceneModuleInfo | undefined = findByName('验证码布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=23`);
      expect(target.serialNumber).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='UI布局'`);
      expect(target.category).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('verifycode/VerifyCodeView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=3`);
      expect(target.ratingNumber).assertEqual(3);
      log('testWaterFlowDataExt0206 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0207
     * @tc.name      testWaterFlowDataExt0207
     * @tc.desc      Verify the chinese to pinyin sample keeps a one star rating.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0207 begin');
      const item: SceneModuleInfo | undefined = findByName('汉字转拼音案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=56`);
      expect(target.serialNumber).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='其他'`);
      expect(target.category).assertEqual('其他');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('chinesetopinyin/ChineseToPinyin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=1`);
      expect(target.ratingNumber).assertEqual(1);
      log('testWaterFlowDataExt0207 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0208
     * @tc.name      testWaterFlowDataExt0208
     * @tc.desc      Verify the analog clock sample is the only swiper image entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0208 begin');
      const item: SceneModuleInfo | undefined = findByName('Canvas实现模拟时钟案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=96`);
      expect(target.serialNumber).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='UI布局'`);
      expect(target.category).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('analogclock/AnalogClock');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=2`);
      expect(target.ratingNumber).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(target.swiperImage as string)}`);
      expect((target.swiperImage as string)).assertEqual('analogclock/AnalogClock');
      log('testWaterFlowDataExt0208 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0209
     * @tc.name      testWaterFlowDataExt0209
     * @tc.desc      Verify the mini player animation sample tops five stars.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0209 begin');
      const item: SceneModuleInfo | undefined = findByName('音乐播放转场一镜到底效果实现');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=100`);
      expect(target.serialNumber).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='动效'`);
      expect(target.category).assertEqual('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('miniplayeranimation/MiniPlayerAnimation');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=5`);
      expect(target.ratingNumber).assertEqual(5);
      log('testWaterFlowDataExt0209 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0210
     * @tc.name      testWaterFlowDataExt0210
     * @tc.desc      Verify the frame node imperative layout sample fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0210 begin');
      const item: SceneModuleInfo | undefined = findByName('使用ArkUI的FrameNode扩展实现动态布局类框架');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=135`);
      expect(target.serialNumber).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='性能示例'`);
      expect(target.category).assertEqual('性能示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('imperativedynamiclayouts/ImperativeView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=4`);
      expect(target.ratingNumber).assertEqual(4);
      log('testWaterFlowDataExt0210 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0211
     * @tc.name      testWaterFlowDataExt0211
     * @tc.desc      Verify the xcomponent vsync native sample fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0211 begin');
      const item: SceneModuleInfo | undefined = findByName('XComponent + Vsync 实现自定义动画');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item !== undefined=${item !== undefined}`);
      expect(item !== undefined).assertTrue();
      const target: SceneModuleInfo = item as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.serialNumber=${target.serialNumber}, expected=97`);
      expect(target.serialNumber).assertEqual(97);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.category=${target.category}, expected='Native'`);
      expect(target.category).assertEqual('Native');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.appUri=${target.appUri}`);
      expect(target.appUri).assertEqual('xcomponentvsync/XcomponentVsync');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual target.ratingNumber=${target.ratingNumber}, expected=4`);
      expect(target.ratingNumber).assertEqual(4);
      log('testWaterFlowDataExt0211 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0212
     * @tc.name      testWaterFlowDataExt0212
     * @tc.desc      Verify pip window and palette samples keep two star ratings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0212 begin');
      const pip: SceneModuleInfo | undefined = findByName('视频悬浮窗');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pip !== undefined=${pip !== undefined}`);
      expect(pip !== undefined).assertTrue();
      const pipTarget: SceneModuleInfo = pip as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual pipTarget.serialNumber=${pipTarget.serialNumber}`);
      expect(pipTarget.serialNumber).assertEqual(161);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual pipTarget.category=${pipTarget.category}, expected='其他'`);
      expect(pipTarget.category).assertEqual('其他');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual pipTarget.appUri=${pipTarget.appUri}`);
      expect(pipTarget.appUri).assertEqual('pipwindow/PipWindowView');
      const palette: SceneModuleInfo | undefined = findByName('画笔调色板案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue palette !== undefined=${palette !== undefined}`);
      expect(palette !== undefined).assertTrue();
      const paletteTarget: SceneModuleInfo = palette as SceneModuleInfo;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual paletteTarget.serialNumber=${paletteTarget.serialNumber}`);
      expect(paletteTarget.serialNumber).assertEqual(130);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual paletteTarget.ratingNumber=${paletteTarget.ratingNumber}`);
      expect(paletteTarget.ratingNumber).assertEqual(2);
      log('testWaterFlowDataExt0212 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0213
     * @tc.name      testWaterFlowDataExt0213
     * @tc.desc      Verify motion effect and third party group sizes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0213 begin');
      const motionItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.category === '动效');
      const thirdPartyItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.category === '三方库');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual motionItems.length=${motionItems.length}, expected=40`);
      expect(motionItems.length).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual thirdPartyItems.length=${thirdPartyItems.length}, expected=6`);
      expect(thirdPartyItems.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assert thirdPartyItems.filter((item: SceneModuleInfo) => item.name ==...`);
      expect(thirdPartyItems.filter((item: SceneModuleInfo) => item.name === 'Lottie动画').length)
        .assertEqual(1);
      log('testWaterFlowDataExt0213 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0214
     * @tc.name      testWaterFlowDataExt0214
     * @tc.desc      Verify ui layout and others group sizes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0214 begin');
      const uiItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.category === 'UI布局');
      const otherItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.category === '其他');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uiItems.length=${uiItems.length}, expected=47`);
      expect(uiItems.length).assertEqual(47);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual otherItems.length=${otherItems.length}, expected=53`);
      expect(otherItems.length).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${uiItems.length + otherItems.length === 100}`);
      expect(uiItems.length + otherItems.length === 100).assertTrue();
      log('testWaterFlowDataExt0214 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATAEXT_0215
     * @tc.name      testWaterFlowDataExt0215
     * @tc.desc      Verify exactly five samples carry the top five star rating.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowDataExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowDataExt0215 begin');
      const topItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.ratingNumber === 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual topItems.length=${topItems.length}, expected=5`);
      expect(topItems.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assert topItems.filter((item: SceneModuleInfo) => item.name === '音乐播放...`);
      expect(topItems.filter((item: SceneModuleInfo) => item.name === '音乐播放转场一镜到底效果实现').length)
        .assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assert topItems.filter((item: SceneModuleInfo) => item.name === '全局自定...`);
      expect(topItems.filter((item: SceneModuleInfo) => item.name === '全局自定义组件复用实现案例').length)
        .assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue topItems.every((item: SceneModuleInfo) => item.ratingNumbe...`);
      expect(topItems.every((item: SceneModuleInfo) => item.ratingNumber === 5)).assertTrue();
      log('testWaterFlowDataExt0215 end');
    })
  })
}
