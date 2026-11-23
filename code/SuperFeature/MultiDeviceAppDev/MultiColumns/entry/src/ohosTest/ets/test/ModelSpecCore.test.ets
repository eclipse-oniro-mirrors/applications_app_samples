/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { OperateTabs, MailType, photoType } from '../../../main/ets/model/DataType';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_MODEL]';

// 期望值来源：规格常量 + 状态推演。
// DataType 三个类的契约：构造函数将入参原样存入同名字段；photoType 的 src 为可选，缺省时字段为 undefined。
// 测试用独立构造的 Resource 字面量作为输入，断言构造结果可取回且字段间不串值。
function makeRes(id: number): Resource {
  return {
    id: id,
    type: 10001,
    bundleName: 'com.samples.multicolumns',
    moduleName: 'entry',
    params: [] as Array<string | number>
  };
}

export default function modelSpecCoreTest() {
  describe('MultiColumnsModelTest', () => {
    const RES_A: Resource = makeRes(1);
    const RES_B: Resource = makeRes(2);
    const RES_C: Resource = makeRes(3);

    beforeEach(() => {
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_MC_MODEL_1001
     * @tc.name testModel0001
     * @tc.desc 合法值：OperateTabs 构造后 src 与 name 字段可取回且不互串
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0001 begin');
      const tab = new OperateTabs(RES_A, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src.id=%{public}d name.id=%{public}d', tab.src.id, tab.name.id);
      expect(tab.src).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tab.name), String(RES_B));
      expect(tab.name).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(tab.src === tab.name));
      expect(tab.src === tab.name).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0001 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1002
     * @tc.name testModel0002
     * @tc.desc 合法值：MailType 构造后 type/num/src 三字段按位存取
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0002 begin');
      const mail = new MailType(RES_A, 5, RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'num=%{public}d', mail.num);
      expect(mail.type).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.num), String(5));
      expect(mail.num).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.src), String(RES_C));
      expect(mail.src).assertEqual(RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0002 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1003
     * @tc.name testModel0003
     * @tc.desc 合法值：photoType 传入 src 时三字段全部落位
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0003 begin');
      const photo = new photoType(RES_A, 1234, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}d', photo.count);
      expect(photo.name).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.count), String(1234));
      expect(photo.count).assertEqual(1234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.src), String(RES_B));
      expect(photo.src).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0003 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1004
     * @tc.name testModel0004
     * @tc.desc 分支/非法：photoType 省略 src 时该字段为 undefined（可选参数分支）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0004 begin');
      const photo = new photoType(RES_A, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src=%{public}s', String(photo.src));
      expect(photo.src === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.name), String(RES_A));
      expect(photo.name).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.count), String(12));
      expect(photo.count).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0004 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1005
     * @tc.name testModel0005
     * @tc.desc 边界值：MailType num 为 0 时字段保留 0 而非被忽略
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0005 begin');
      const mail = new MailType(RES_A, 0, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'num=%{public}d', mail.num);
      expect(mail.num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(mail.num === undefined));
      expect(mail.num === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.src), String(RES_B));
      expect(mail.src).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0005 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1006
     * @tc.name testModel0006
     * @tc.desc 边界值：photoType count 为负数与 0 时原样存字段
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0006 begin');
      const neg = new photoType(RES_A, -7);
      const zero = new photoType(RES_B, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'neg=%{public}d zero=%{public}d', neg.count, zero.count);
      expect(neg.count).assertEqual(-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(zero.count), String(0));
      expect(zero.count).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(neg.count === zero.count));
      expect(neg.count === zero.count).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0006 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1007
     * @tc.name testModel0007
     * @tc.desc 极值：MailType num 使用 Number.MAX_SAFE_INTEGER 不溢出
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0007 begin');
      const mail = new MailType(RES_A, Number.MAX_SAFE_INTEGER, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'num=%{public}s', String(mail.num));
      expect(mail.num).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(mail.num > 0));
      expect(mail.num > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(mail.num === undefined));
      expect(mail.num === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0007 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1008
     * @tc.name testModel0008
     * @tc.desc 极值：photoType count 使用超大安全整数原样存取
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0008 begin');
      const photo = new photoType(RES_A, Number.MAX_SAFE_INTEGER, RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}s', String(photo.count));
      expect(photo.count).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.src), String(RES_C));
      expect(photo.src).assertEqual(RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.name), String(RES_A));
      expect(photo.name).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0008 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1009
     * @tc.name testModel0009
     * @tc.desc 合法值：MailType 还原 mailState 基线首项 num=3
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0009 begin');
      const mailStateNums: number[] = [3, 5, 9, 0];
      const list: MailType[] = [
        new MailType(RES_A, mailStateNums[0], RES_A),
        new MailType(RES_B, mailStateNums[1], RES_B),
        new MailType(RES_C, mailStateNums[2], RES_C),
        new MailType(RES_A, mailStateNums[3], RES_A)
      ];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}d last=%{public}d', list[0].num, list[3].num);
      expect(list[0].num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(list[2].num), String(9));
      expect(list[2].num).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(list[3].num), String(0));
      expect(list[3].num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0009 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1010
     * @tc.name testModel0010
     * @tc.desc 组合值：photoType 列表还原 PhotoContent 计数基线（1234/12/7/11）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0010 begin');
      const albums: photoType[] = [
        new photoType(RES_A, 1234, RES_A),
        new photoType(RES_B, 12, RES_B),
        new photoType(RES_C, 7, RES_C),
        new photoType(RES_A, 11, RES_B)
      ];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sum=%{public}d', albums.length);
      expect(albums[0].count).assertEqual(1234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(albums[1].count), String(12));
      expect(albums[1].count).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(albums[3].count), String(11));
      expect(albums[3].count).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0010 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1011
     * @tc.name testModel0011
     * @tc.desc 状态：photoType src 显式传 undefined 与省略参数结果一致
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0011 begin');
      const omitted = new photoType(RES_A, 1);
      const explicit = new photoType(RES_A, 1, undefined);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'omitted=%{public}s explicit=%{public}s',
        String(omitted.src), String(explicit.src));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(omitted.src === undefined));
      expect(omitted.src === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(explicit.src === undefined));
      expect(explicit.src === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(omitted.count), String(explicit.count));
      expect(omitted.count).assertEqual(explicit.count);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0011 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1012
     * @tc.name testModel0012
     * @tc.desc 状态：构造后改写公有字段可被读回
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0012 begin');
      const mail = new MailType(RES_A, 5, RES_B);
      mail.num = 42;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'num after mutate=%{public}d', mail.num);
      expect(mail.num).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(mail.num === 5));
      expect(mail.num === 5).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.src), String(RES_B));
      expect(mail.src).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0012 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1013
     * @tc.name testModel0013
     * @tc.desc 状态：两个实例相互独立，改一个不影响另一个
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0013 begin');
      const a = new photoType(RES_A, 10);
      const b = new photoType(RES_A, 20);
      a.count = 999;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'a=%{public}d b=%{public}d', a.count, b.count);
      expect(a.count).assertEqual(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(b.count), String(20));
      expect(b.count).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(a.count === b.count));
      expect(a.count === b.count).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0013 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1014
     * @tc.name testModel0014
     * @tc.desc 状态：同参重复构造结果稳定（构造无副作用）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0014 begin');
      const first = new MailType(RES_A, 3, RES_B);
      const second = new MailType(RES_A, 3, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first.num=%{public}d second.num=%{public}d', first.num, second.num);
      expect(first.num).assertEqual(second.num);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.type), String(second.type));
      expect(first.type).assertEqual(second.type);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.src), String(second.src));
      expect(first.src).assertEqual(second.src);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0014 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1015
     * @tc.name testModel0015
     * @tc.desc 非法值：MailType num 传非规格值（小数）仍原样存取
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0015 begin');
      const mail = new MailType(RES_A, 2.5, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'num=%{public}s', String(mail.num));
      expect(mail.num).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(mail.num === 2));
      expect(mail.num === 2).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.type), String(RES_A));
      expect(mail.type).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0015 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1016
     * @tc.name testModel0016
     * @tc.desc 合法值：OperateTabs src 与 name 引用同一资源时字段相等
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0016 begin');
      const same = makeRes(77);
      const tab = new OperateTabs(same, same);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src.id=%{public}d', tab.src.id);
      expect(tab.src).assertEqual(same);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tab.name), String(same));
      expect(tab.name).assertEqual(same);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(tab.src === tab.name));
      expect(tab.src === tab.name).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0016 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1017
     * @tc.name testModel0017
     * @tc.desc 边界值：MailType type 与 src 使用不同 id 时字段区分
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0017 begin');
      const mail = new MailType(makeRes(10), 1, makeRes(20));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'type.id=%{public}d src.id=%{public}d', mail.type.id, mail.src.id);
      expect(mail.type.id).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.src.id), String(20));
      expect(mail.src.id).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(mail.type === mail.src));
      expect(mail.type === mail.src).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0017 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1018
     * @tc.name testModel0018
     * @tc.desc 合法值：photoType 计数基线还原 PhotoSideBar hidden=1（末项锁图标项）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0018 begin');
      const side: photoType[] = [
        new photoType(RES_A, 223),
        new photoType(RES_B, 125),
        new photoType(RES_C, 234),
        new photoType(RES_A, 1)
      ];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'last.count=%{public}d', side[side.length - 1].count);
      expect(side[0].count).assertEqual(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(side[2].count), String(234));
      expect(side[2].count).assertEqual(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(side[side.length - 1].count), String(1));
      expect(side[side.length - 1].count).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0018 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1019
     * @tc.name testModel0019
     * @tc.desc 组合值：三类混装数组按各自字段读取互不干扰
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0019 begin');
      const tabs = new OperateTabs(RES_A, RES_B);
      const mail = new MailType(RES_C, 8, RES_A);
      const photo = new photoType(RES_B, 64, RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mail.num=%{public}d photo.count=%{public}d', mail.num, photo.count);
      expect(tabs.name).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.num), String(8));
      expect(mail.num).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.count), String(64));
      expect(photo.count).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0019 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1020
     * @tc.name testModel0020
     * @tc.desc 边界值：photoType count 为 1（最小非零相册数）时字段成立
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0020 begin');
      const photo = new photoType(RES_A, 1, RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}d', photo.count);
      expect(photo.count).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(photo.count > 0));
      expect(photo.count > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.name), String(RES_A));
      expect(photo.name).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0020 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1021
     * @tc.name testModel0021
     * @tc.desc 非法值：MailType num 传 NaN 时字段为 NaN（无隐式修正）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0021 begin');
      const mail = new MailType(RES_A, NaN, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'isNaN=%{public}s', String(Number.isNaN(mail.num)));
      expect(Number.isNaN(mail.num)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.type), String(RES_A));
      expect(mail.type).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.src), String(RES_B));
      expect(mail.src).assertEqual(RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0021 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1022
     * @tc.name testModel0022
     * @tc.desc 状态：OperateTabs 字段改写后读回新值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0022 begin');
      const tab = new OperateTabs(RES_A, RES_B);
      tab.name = RES_C;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'name.id=%{public}d', tab.name.id);
      expect(tab.name).assertEqual(RES_C);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tab.src), String(RES_A));
      expect(tab.src).assertEqual(RES_A);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(tab.name === RES_B));
      expect(tab.name === RES_B).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0022 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1023
     * @tc.name testModel0023
     * @tc.desc 合法值：photoType 完整三参构造 src 保留资源引用不变
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0023 begin');
      const srcRes = makeRes(888);
      const photo = new photoType(RES_A, 5, srcRes);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'src.id=%{public}d', photo.src !== undefined ? photo.src.id : -1);
      expect(photo.src).assertEqual(srcRes);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(photo.src !== undefined));
      expect(photo.src !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.count), String(5));
      expect(photo.count).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0023 end');
    });

    /**
     * @tc.number SUB_MC_MODEL_1024
     * @tc.name testModel0024
     * @tc.desc 组合值：MailType 全字段与 photoType 全字段交叉比对独立性
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0024 begin');
      const mail = new MailType(RES_A, 100, RES_B);
      const photo = new photoType(RES_A, 100, RES_B);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mail.num=%{public}d photo.count=%{public}d', mail.num, photo.count);
      expect(mail.num).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(photo.count), String(100));
      expect(photo.count).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mail.type), String(photo.name));
      expect(mail.type).assertEqual(photo.name);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0024 end');
    });
  });
}
