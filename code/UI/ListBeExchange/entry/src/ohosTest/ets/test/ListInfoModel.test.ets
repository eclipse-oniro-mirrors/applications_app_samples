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
import { ListInfo } from 'listexchange/src/main/ets/model/ListInfo';

const DOMAIN: number = 0xF814;
const TAG: string = 'ListInfoModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function listInfoModelTest(): void {
  describe('ListInfoModelTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0001
     * @tc.name      testListInfo0001
     * @tc.desc      Verify default constructor leaves icon and name as empty strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0001 begin');
      const info: ListInfo = new ListInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected=''`);
      expect(info.icon).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected=''`);
      expect(info.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.icon=${typeof info.icon}, expected='string'`);
      expect(typeof info.icon).assertEqual('string');
      log('testListInfo0001 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0002
     * @tc.name      testListInfo0002
     * @tc.desc      Verify constructor with icon only keeps the default empty name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0002 begin');
      const info: ListInfo = new ListInfo('icon_only');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected='icon_only'`);
      expect(info.icon).assertEqual('icon_only');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected=''`);
      expect(info.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.name=${typeof info.name}, expected='string'`);
      expect(typeof info.name).assertEqual('string');
      log('testListInfo0002 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0003
     * @tc.name      testListInfo0003
     * @tc.desc      Verify constructor stores both icon and name values as given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0003 begin');
      const info: ListInfo = new ListInfo('icon_full', '列表项A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected='icon_full'`);
      expect(info.icon).assertEqual('icon_full');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='列表项A'`);
      expect(info.name).assertEqual('列表项A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (info.name as string).length=${(info.name as string).length}`);
      expect((info.name as string).length).assertEqual(4);
      log('testListInfo0003 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0004
     * @tc.name      testListInfo0004
     * @tc.desc      Verify constructor accepting explicit empty strings keeps both fields empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0004 begin');
      const info: ListInfo = new ListInfo('', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected=''`);
      expect(info.icon).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected=''`);
      expect(info.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (info.name as string).length=${(info.name as string).length}`);
      expect((info.name as string).length).assertEqual(0);
      log('testListInfo0004 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0005
     * @tc.name      testListInfo0005
     * @tc.desc      Verify name field can be reassigned after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0005 begin');
      const info: ListInfo = new ListInfo('icon_m', '初始名');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='初始名'`);
      expect(info.name).assertEqual('初始名');
      info.name = '更新名';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='更新名'`);
      expect(info.name).assertEqual('更新名');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse info.name === '初始名'=${info.name === '初始名'}`);
      expect(info.name === '初始名').assertFalse();
      log('testListInfo0005 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0006
     * @tc.name      testListInfo0006
     * @tc.desc      Verify icon field keeps a long string value without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0006 begin');
      let longIcon: string = '';
      for (let i: number = 0; i < 100; i++) {
        longIcon = longIcon + 'a';
      }
      const info: ListInfo = new ListInfo(longIcon, '长图标');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected=longIcon`);
      expect(info.icon).assertEqual(longIcon);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (info.icon as string).length=${(info.icon as string).length}`);
      expect((info.icon as string).length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='长图标'`);
      expect(info.name).assertEqual('长图标');
      log('testListInfo0006 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0007
     * @tc.name      testListInfo0007
     * @tc.desc      Verify name field preserves CJK characters exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0007 begin');
      const info: ListInfo = new ListInfo('icon_cn', '中文测试名称');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='中文测试名称'`);
      expect(info.name).assertEqual('中文测试名称');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.name=${typeof info.name}, expected='string'`);
      expect(typeof info.name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (info.name as string).length=${(info.name as string).length}`);
      expect((info.name as string).length).assertEqual(6);
      log('testListInfo0007 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0008
     * @tc.name      testListInfo0008
     * @tc.desc      Verify name field preserves spaces and special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0008 begin');
      const info: ListInfo = new ListInfo('icon_sp', 'A B/C-D_E（1234）');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='A B/C-D_E（1234）'`);
      expect(info.name).assertEqual('A B/C-D_E（1234）');
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert name length equals 15');
      expect(info.name.toString().length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain info.name=${info.name}, expected='B/C'`);
      expect(info.name).assertContain('B/C');
      log('testListInfo0008 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0009
     * @tc.name      testListInfo0009
     * @tc.desc      Verify two instances mutate independently without affecting each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0009 begin');
      const first: ListInfo = new ListInfo('icon_1', '第一条');
      const second: ListInfo = new ListInfo('icon_2', '第二条');
      first.name = '第一条-改';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.name=${second.name}, expected='第二条'`);
      expect(second.name).assertEqual('第二条');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.name=${first.name}, expected='第一条-改'`);
      expect(first.name).assertEqual('第一条-改');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      log('testListInfo0009 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0010
     * @tc.name      testListInfo0010
     * @tc.desc      Verify constructed instance is a ListInfo object with expected runtime type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0010 begin');
      const info: ListInfo = new ListInfo('icon_t', '类型');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue info instanceof ListInfo=${info instanceof ListInfo}`);
      expect(info instanceof ListInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info=${typeof info}, expected='object'`);
      expect(typeof info).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected='icon_t'`);
      expect(info.icon).assertEqual('icon_t');
      log('testListInfo0010 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0011
     * @tc.name      testListInfo0011
     * @tc.desc      Verify numeric-looking string stays a string in the icon field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0011 begin');
      const info: ListInfo = new ListInfo('12345', '数字图标');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected='12345'`);
      expect(info.icon).assertEqual('12345');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.icon=${typeof info.icon}, expected='string'`);
      expect(typeof info.icon).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual (info.icon as string).length=${(info.icon as string).length}`);
      expect((info.icon as string).length).assertEqual(5);
      log('testListInfo0011 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LISTINFO_0012
     * @tc.name      testListInfo0012
     * @tc.desc      Verify icon and name fields can be updated independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testListInfo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testListInfo0012 begin');
      const info: ListInfo = new ListInfo('icon_old', '名字旧');
      info.icon = 'icon_new';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='名字旧'`);
      expect(info.name).assertEqual('名字旧');
      info.name = '名字新';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.icon=${info.icon}, expected='icon_new'`);
      expect(info.icon).assertEqual('icon_new');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.name=${info.name}, expected='名字新'`);
      expect(info.name).assertEqual('名字新');
      log('testListInfo0012 end');
    })
  })
}
