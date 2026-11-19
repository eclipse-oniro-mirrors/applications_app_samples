/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { TitleAttribute } from '../../../main/ets/model/TitleAttribute';

const DOMAIN: number = 0xF814;
const TAG: string = 'TitleAttributeModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

class DummyTitleModifierA implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.fontSize(10);
  }
}

class DummyTitleModifierB implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.fontColor('#000000');
  }
}

export default function titleAttributeModelCoreTest(): void {
  describe('TitleAttributeModelCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0301
     * @tc.name      testTitleAttributeModelCore0301
     * @tc.desc      Verify text getter returns the string passed to the constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0301 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='All notes'`);
      expect(actual).assertEqual('All notes');
      log('testTitleAttributeModelCore0301 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0302
     * @tc.name      testTitleAttributeModelCore0302
     * @tc.desc      Verify string title text getter exposes a string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0302 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testTitleAttributeModelCore0302 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0303
     * @tc.name      testTitleAttributeModelCore0303
     * @tc.desc      Verify attribute getter returns the modifier instance passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0303 begin');
      const modifier: DummyTitleModifierA = new DummyTitleModifierA();
      const title: TitleAttribute = new TitleAttribute('All notes', modifier);
      const actual: AttributeModifier<TextAttribute> = title.attribute;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === modifier=${actual === modifier}`);
      expect(actual === modifier).assertTrue();
      log('testTitleAttributeModelCore0303 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0304
     * @tc.name      testTitleAttributeModelCore0304
     * @tc.desc      Verify empty string title is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0304 begin');
      const title: TitleAttribute = new TitleAttribute('', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=''`);
      expect(actual).assertEqual('');
      log('testTitleAttributeModelCore0304 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0305
     * @tc.name      testTitleAttributeModelCore0305
     * @tc.desc      Verify long title string is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0305 begin');
      const longText: string = 'Notebook title sample with a very long descriptive sentence for testing';
      const title: TitleAttribute = new TitleAttribute(longText, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=longText`);
      expect(actual).assertEqual(longText);
      log('testTitleAttributeModelCore0305 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0306
     * @tc.name      testTitleAttributeModelCore0306
     * @tc.desc      Verify numeric title string is stored as a string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0306 begin');
      const title: TitleAttribute = new TitleAttribute('12345', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='12345'`);
      expect(actual).assertEqual('12345');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testTitleAttributeModelCore0306 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0307
     * @tc.name      testTitleAttributeModelCore0307
     * @tc.desc      Verify special character title is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0307 begin');
      const special: string = '@#$%^&*()!';
      const title: TitleAttribute = new TitleAttribute(special, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=special`);
      expect(actual).assertEqual(special);
      log('testTitleAttributeModelCore0307 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0308
     * @tc.name      testTitleAttributeModelCore0308
     * @tc.desc      Verify Chinese title text is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0308 begin');
      const chinese: string = '全部笔记';
      const title: TitleAttribute = new TitleAttribute(chinese, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=chinese`);
      expect(actual).assertEqual(chinese);
      log('testTitleAttributeModelCore0308 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0309
     * @tc.name      testTitleAttributeModelCore0309
     * @tc.desc      Verify two instances keep independent title texts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0309 begin');
      const first: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const second: TitleAttribute = new TitleAttribute('8 notes', new DummyTitleModifierA());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.text=${first.text}, expected='All notes'`);
      expect(first.text).assertEqual('All notes');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.text=${second.text}, expected='8 notes'`);
      expect(second.text).assertEqual('8 notes');
      log('testTitleAttributeModelCore0309 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0310
     * @tc.name      testTitleAttributeModelCore0310
     * @tc.desc      Verify repeated text getter reads stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0310 begin');
      const title: TitleAttribute = new TitleAttribute('Stable', new DummyTitleModifierA());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual title.text=${title.text}, expected=title.text`);
      expect(title.text).assertEqual(title.text);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual title.text=${title.text}, expected=title.text`);
      expect(title.text).assertEqual(title.text);
      log('testTitleAttributeModelCore0310 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0311
     * @tc.name      testTitleAttributeModelCore0311
     * @tc.desc      Verify repeated attribute getter reads return the same modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0311 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${title.attribute === title.attribute}`);
      expect(title.attribute === title.attribute).assertTrue();
      log('testTitleAttributeModelCore0311 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0312
     * @tc.name      testTitleAttributeModelCore0312
     * @tc.desc      Verify attribute getter keeps the first modifier when another modifier is created later.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0312 begin');
      const firstModifier: DummyTitleModifierA = new DummyTitleModifierA();
      const title: TitleAttribute = new TitleAttribute('All notes', firstModifier);
      const unusedModifier: DummyTitleModifierB = new DummyTitleModifierB();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${title.attribute === firstModifier}`);
      expect(title.attribute === firstModifier).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${title.attribute === unusedModifier}`);
      expect(title.attribute === unusedModifier).assertFalse();
      log('testTitleAttributeModelCore0312 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0313
     * @tc.name      testTitleAttributeModelCore0313
     * @tc.desc      Verify modifier of a different class is stored correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0313 begin');
      const modifier: DummyTitleModifierB = new DummyTitleModifierB();
      const title: TitleAttribute = new TitleAttribute('All notes', modifier);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue title.attribute === modifier=${title.attribute === modifier}`);
      expect(title.attribute === modifier).assertTrue();
      log('testTitleAttributeModelCore0313 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0314
     * @tc.name      testTitleAttributeModelCore0314
     * @tc.desc      Verify resource title text is exposed as an object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0314 begin');
      const resource: Resource = $r('app.string.module_test_desc');
      const title: TitleAttribute = new TitleAttribute(resource, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='object'`);
      expect(typeof actual).assertEqual('object');
      log('testTitleAttributeModelCore0314 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0315
     * @tc.name      testTitleAttributeModelCore0315
     * @tc.desc      Verify resource title text getter returns the same resource instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0315 begin');
      const resource: Resource = $r('app.string.module_test_desc');
      const title: TitleAttribute = new TitleAttribute(resource, new DummyTitleModifierA());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue title.text === resource=${title.text === resource}`);
      expect(title.text === resource).assertTrue();
      log('testTitleAttributeModelCore0315 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0316
     * @tc.name      testTitleAttributeModelCore0316
     * @tc.desc      Verify title with blank spaces is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0316 begin');
      const spaced: string = 'All notes 8 items';
      const title: TitleAttribute = new TitleAttribute(spaced, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=spaced`);
      expect(actual).assertEqual(spaced);
      log('testTitleAttributeModelCore0316 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0317
     * @tc.name      testTitleAttributeModelCore0317
     * @tc.desc      Verify text length matches the constructed title length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0317 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (actual as string).length=${(actual as string).length}`);
      expect((actual as string).length).assertEqual(9);
      log('testTitleAttributeModelCore0317 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0318
     * @tc.name      testTitleAttributeModelCore0318
     * @tc.desc      Verify emoji title text is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0318 begin');
      const emoji: string = 'Notes ☀ ☂';
      const title: TitleAttribute = new TitleAttribute(emoji, new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=emoji`);
      expect(actual).assertEqual(emoji);
      log('testTitleAttributeModelCore0318 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0319
     * @tc.name      testTitleAttributeModelCore0319
     * @tc.desc      Verify instances constructed with the same title share equal text values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0319 begin');
      const first: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const second: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierB());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.text=${first.text}, expected=second.text`);
      expect(first.text).assertEqual(second.text);
      log('testTitleAttributeModelCore0319 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0320
     * @tc.name      testTitleAttributeModelCore0320
     * @tc.desc      Verify attribute getter exposes an object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0320 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const actual: AttributeModifier<TextAttribute> = title.attribute;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='object'`);
      expect(typeof actual).assertEqual('object');
      log('testTitleAttributeModelCore0320 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0321
     * @tc.name      testTitleAttributeModelCore0321
     * @tc.desc      Verify constructed instance is recognized as TitleAttribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0321 begin');
      const title: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${title instanceof TitleAttribute}`);
      expect(title instanceof TitleAttribute).assertTrue();
      log('testTitleAttributeModelCore0321 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0322
     * @tc.name      testTitleAttributeModelCore0322
     * @tc.desc      Verify modifiers from different classes are not the same reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0322 begin');
      const first: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierA());
      const second: TitleAttribute = new TitleAttribute('All notes', new DummyTitleModifierB());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${first.attribute === second.attribute}`);
      expect(first.attribute === second.attribute).assertFalse();
      log('testTitleAttributeModelCore0322 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLEATTR_0323
     * @tc.name      testTitleAttributeModelCore0323
     * @tc.desc      Verify single character title is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleAttributeModelCore0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTitleAttributeModelCore0323 begin');
      const title: TitleAttribute = new TitleAttribute('A', new DummyTitleModifierA());
      const actual: string | Resource = title.text;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='A'`);
      expect(actual).assertEqual('A');
      log('testTitleAttributeModelCore0323 end');
    })
  })
}
