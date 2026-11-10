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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { url } from '@kit.ArkTS';

export default function urlParseExpandedTest() {
  describe('urlParseExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0001
     * @tc.name      testExpUrlP0001
     * @tc.desc      URL path and query component 0 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p0?k=0&x=1#f0';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p0');
      expect(parsed.searchParams.get('k')).assertEqual('0');
      expect(parsed.hash).assertEqual('#f0');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0002
     * @tc.name      testExpUrlP0002
     * @tc.desc      URL path and query component 1 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p1?k=1&x=1#f1';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p1');
      expect(parsed.searchParams.get('k')).assertEqual('1');
      expect(parsed.hash).assertEqual('#f1');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0003
     * @tc.name      testExpUrlP0003
     * @tc.desc      URL path and query component 2 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p2?k=2&x=1#f2';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p2');
      expect(parsed.searchParams.get('k')).assertEqual('2');
      expect(parsed.hash).assertEqual('#f2');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0004
     * @tc.name      testExpUrlP0004
     * @tc.desc      URL path and query component 3 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p3?k=3&x=1#f3';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p3');
      expect(parsed.searchParams.get('k')).assertEqual('3');
      expect(parsed.hash).assertEqual('#f3');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0005
     * @tc.name      testExpUrlP0005
     * @tc.desc      URL path and query component 4 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p4?k=4&x=1#f4';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p4');
      expect(parsed.searchParams.get('k')).assertEqual('4');
      expect(parsed.hash).assertEqual('#f4');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0006
     * @tc.name      testExpUrlP0006
     * @tc.desc      URL path and query component 5 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p5?k=5&x=1#f5';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p5');
      expect(parsed.searchParams.get('k')).assertEqual('5');
      expect(parsed.hash).assertEqual('#f5');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0007
     * @tc.name      testExpUrlP0007
     * @tc.desc      URL path and query component 6 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p6?k=6&x=1#f6';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p6');
      expect(parsed.searchParams.get('k')).assertEqual('6');
      expect(parsed.hash).assertEqual('#f6');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0008
     * @tc.name      testExpUrlP0008
     * @tc.desc      URL path and query component 7 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p7?k=7&x=1#f7';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p7');
      expect(parsed.searchParams.get('k')).assertEqual('7');
      expect(parsed.hash).assertEqual('#f7');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0009
     * @tc.name      testExpUrlP0009
     * @tc.desc      URL path and query component 8 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p8?k=8&x=1#f8';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p8');
      expect(parsed.searchParams.get('k')).assertEqual('8');
      expect(parsed.hash).assertEqual('#f8');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0010
     * @tc.name      testExpUrlP0010
     * @tc.desc      URL path and query component 9 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p9?k=9&x=1#f9';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p9');
      expect(parsed.searchParams.get('k')).assertEqual('9');
      expect(parsed.hash).assertEqual('#f9');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0011
     * @tc.name      testExpUrlP0011
     * @tc.desc      URL path and query component 10 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p10?k=10&x=1#f10';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p10');
      expect(parsed.searchParams.get('k')).assertEqual('10');
      expect(parsed.hash).assertEqual('#f10');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0012
     * @tc.name      testExpUrlP0012
     * @tc.desc      URL path and query component 11 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p11?k=11&x=1#f11';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p11');
      expect(parsed.searchParams.get('k')).assertEqual('11');
      expect(parsed.hash).assertEqual('#f11');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0013
     * @tc.name      testExpUrlP0013
     * @tc.desc      URL path and query component 12 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p12?k=12&x=1#f12';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p12');
      expect(parsed.searchParams.get('k')).assertEqual('12');
      expect(parsed.hash).assertEqual('#f12');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0014
     * @tc.name      testExpUrlP0014
     * @tc.desc      URL path and query component 13 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p13?k=13&x=1#f13';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p13');
      expect(parsed.searchParams.get('k')).assertEqual('13');
      expect(parsed.hash).assertEqual('#f13');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0015
     * @tc.name      testExpUrlP0015
     * @tc.desc      URL path and query component 14 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p14?k=14&x=1#f14';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p14');
      expect(parsed.searchParams.get('k')).assertEqual('14');
      expect(parsed.hash).assertEqual('#f14');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0016
     * @tc.name      testExpUrlP0016
     * @tc.desc      URL path and query component 15 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p15?k=15&x=1#f15';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p15');
      expect(parsed.searchParams.get('k')).assertEqual('15');
      expect(parsed.hash).assertEqual('#f15');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0017
     * @tc.name      testExpUrlP0017
     * @tc.desc      URL path and query component 16 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p16?k=16&x=1#f16';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p16');
      expect(parsed.searchParams.get('k')).assertEqual('16');
      expect(parsed.hash).assertEqual('#f16');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0018
     * @tc.name      testExpUrlP0018
     * @tc.desc      URL path and query component 17 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p17?k=17&x=1#f17';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p17');
      expect(parsed.searchParams.get('k')).assertEqual('17');
      expect(parsed.hash).assertEqual('#f17');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0019
     * @tc.name      testExpUrlP0019
     * @tc.desc      URL path and query component 18 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p18?k=18&x=1#f18';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p18');
      expect(parsed.searchParams.get('k')).assertEqual('18');
      expect(parsed.hash).assertEqual('#f18');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0020
     * @tc.name      testExpUrlP0020
     * @tc.desc      URL path and query component 19 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p19?k=19&x=1#f19';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p19');
      expect(parsed.searchParams.get('k')).assertEqual('19');
      expect(parsed.hash).assertEqual('#f19');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0021
     * @tc.name      testExpUrlP0021
     * @tc.desc      URL path and query component 20 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p20?k=20&x=1#f20';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p20');
      expect(parsed.searchParams.get('k')).assertEqual('20');
      expect(parsed.hash).assertEqual('#f20');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0022
     * @tc.name      testExpUrlP0022
     * @tc.desc      URL path and query component 21 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p21?k=21&x=1#f21';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p21');
      expect(parsed.searchParams.get('k')).assertEqual('21');
      expect(parsed.hash).assertEqual('#f21');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0023
     * @tc.name      testExpUrlP0023
     * @tc.desc      URL path and query component 22 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p22?k=22&x=1#f22';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p22');
      expect(parsed.searchParams.get('k')).assertEqual('22');
      expect(parsed.hash).assertEqual('#f22');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0024
     * @tc.name      testExpUrlP0024
     * @tc.desc      URL path and query component 23 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p23?k=23&x=1#f23';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p23');
      expect(parsed.searchParams.get('k')).assertEqual('23');
      expect(parsed.hash).assertEqual('#f23');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0025
     * @tc.name      testExpUrlP0025
     * @tc.desc      URL path and query component 24 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p24?k=24&x=1#f24';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p24');
      expect(parsed.searchParams.get('k')).assertEqual('24');
      expect(parsed.hash).assertEqual('#f24');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0026
     * @tc.name      testExpUrlP0026
     * @tc.desc      URL path and query component 25 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p25?k=25&x=1#f25';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p25');
      expect(parsed.searchParams.get('k')).assertEqual('25');
      expect(parsed.hash).assertEqual('#f25');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0027
     * @tc.name      testExpUrlP0027
     * @tc.desc      URL path and query component 26 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p26?k=26&x=1#f26';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p26');
      expect(parsed.searchParams.get('k')).assertEqual('26');
      expect(parsed.hash).assertEqual('#f26');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0028
     * @tc.name      testExpUrlP0028
     * @tc.desc      URL path and query component 27 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p27?k=27&x=1#f27';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p27');
      expect(parsed.searchParams.get('k')).assertEqual('27');
      expect(parsed.hash).assertEqual('#f27');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0029
     * @tc.name      testExpUrlP0029
     * @tc.desc      URL path and query component 28 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p28?k=28&x=1#f28';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p28');
      expect(parsed.searchParams.get('k')).assertEqual('28');
      expect(parsed.hash).assertEqual('#f28');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0030
     * @tc.name      testExpUrlP0030
     * @tc.desc      URL path and query component 29 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p29?k=29&x=1#f29';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p29');
      expect(parsed.searchParams.get('k')).assertEqual('29');
      expect(parsed.hash).assertEqual('#f29');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0031
     * @tc.name      testExpUrlP0031
     * @tc.desc      URL path and query component 30 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p30?k=30&x=1#f30';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p30');
      expect(parsed.searchParams.get('k')).assertEqual('30');
      expect(parsed.hash).assertEqual('#f30');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0032
     * @tc.name      testExpUrlP0032
     * @tc.desc      URL path and query component 31 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p31?k=31&x=1#f31';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p31');
      expect(parsed.searchParams.get('k')).assertEqual('31');
      expect(parsed.hash).assertEqual('#f31');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0033
     * @tc.name      testExpUrlP0033
     * @tc.desc      URL path and query component 32 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p32?k=32&x=1#f32';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p32');
      expect(parsed.searchParams.get('k')).assertEqual('32');
      expect(parsed.hash).assertEqual('#f32');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0034
     * @tc.name      testExpUrlP0034
     * @tc.desc      URL path and query component 33 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p33?k=33&x=1#f33';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p33');
      expect(parsed.searchParams.get('k')).assertEqual('33');
      expect(parsed.hash).assertEqual('#f33');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0035
     * @tc.name      testExpUrlP0035
     * @tc.desc      URL path and query component 34 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p34?k=34&x=1#f34';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p34');
      expect(parsed.searchParams.get('k')).assertEqual('34');
      expect(parsed.hash).assertEqual('#f34');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0036
     * @tc.name      testExpUrlP0036
     * @tc.desc      URL path and query component 35 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p35?k=35&x=1#f35';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p35');
      expect(parsed.searchParams.get('k')).assertEqual('35');
      expect(parsed.hash).assertEqual('#f35');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0037
     * @tc.name      testExpUrlP0037
     * @tc.desc      URL path and query component 36 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p36?k=36&x=1#f36';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p36');
      expect(parsed.searchParams.get('k')).assertEqual('36');
      expect(parsed.hash).assertEqual('#f36');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0038
     * @tc.name      testExpUrlP0038
     * @tc.desc      URL path and query component 37 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p37?k=37&x=1#f37';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p37');
      expect(parsed.searchParams.get('k')).assertEqual('37');
      expect(parsed.hash).assertEqual('#f37');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0039
     * @tc.name      testExpUrlP0039
     * @tc.desc      URL path and query component 38 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p38?k=38&x=1#f38';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p38');
      expect(parsed.searchParams.get('k')).assertEqual('38');
      expect(parsed.hash).assertEqual('#f38');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0040
     * @tc.name      testExpUrlP0040
     * @tc.desc      URL path and query component 39 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p39?k=39&x=1#f39';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p39');
      expect(parsed.searchParams.get('k')).assertEqual('39');
      expect(parsed.hash).assertEqual('#f39');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0041
     * @tc.name      testExpUrlP0041
     * @tc.desc      URL path and query component 40 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p40?k=40&x=1#f40';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p40');
      expect(parsed.searchParams.get('k')).assertEqual('40');
      expect(parsed.hash).assertEqual('#f40');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0042
     * @tc.name      testExpUrlP0042
     * @tc.desc      URL path and query component 41 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p41?k=41&x=1#f41';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p41');
      expect(parsed.searchParams.get('k')).assertEqual('41');
      expect(parsed.hash).assertEqual('#f41');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0043
     * @tc.name      testExpUrlP0043
     * @tc.desc      URL path and query component 42 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p42?k=42&x=1#f42';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p42');
      expect(parsed.searchParams.get('k')).assertEqual('42');
      expect(parsed.hash).assertEqual('#f42');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0044
     * @tc.name      testExpUrlP0044
     * @tc.desc      URL path and query component 43 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p43?k=43&x=1#f43';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p43');
      expect(parsed.searchParams.get('k')).assertEqual('43');
      expect(parsed.hash).assertEqual('#f43');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0045
     * @tc.name      testExpUrlP0045
     * @tc.desc      URL path and query component 44 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p44?k=44&x=1#f44';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p44');
      expect(parsed.searchParams.get('k')).assertEqual('44');
      expect(parsed.hash).assertEqual('#f44');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0046
     * @tc.name      testExpUrlP0046
     * @tc.desc      URL path and query component 45 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p45?k=45&x=1#f45';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p45');
      expect(parsed.searchParams.get('k')).assertEqual('45');
      expect(parsed.hash).assertEqual('#f45');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0047
     * @tc.name      testExpUrlP0047
     * @tc.desc      URL path and query component 46 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p46?k=46&x=1#f46';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p46');
      expect(parsed.searchParams.get('k')).assertEqual('46');
      expect(parsed.hash).assertEqual('#f46');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0048
     * @tc.name      testExpUrlP0048
     * @tc.desc      URL path and query component 47 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p47?k=47&x=1#f47';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p47');
      expect(parsed.searchParams.get('k')).assertEqual('47');
      expect(parsed.hash).assertEqual('#f47');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0049
     * @tc.name      testExpUrlP0049
     * @tc.desc      URL path and query component 48 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p48?k=48&x=1#f48';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p48');
      expect(parsed.searchParams.get('k')).assertEqual('48');
      expect(parsed.hash).assertEqual('#f48');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0050
     * @tc.name      testExpUrlP0050
     * @tc.desc      URL path and query component 49 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p49?k=49&x=1#f49';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p49');
      expect(parsed.searchParams.get('k')).assertEqual('49');
      expect(parsed.hash).assertEqual('#f49');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0051
     * @tc.name      testExpUrlP0051
     * @tc.desc      URL path and query component 50 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p50?k=50&x=1#f50';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p50');
      expect(parsed.searchParams.get('k')).assertEqual('50');
      expect(parsed.hash).assertEqual('#f50');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0052
     * @tc.name      testExpUrlP0052
     * @tc.desc      URL path and query component 51 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p51?k=51&x=1#f51';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p51');
      expect(parsed.searchParams.get('k')).assertEqual('51');
      expect(parsed.hash).assertEqual('#f51');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0053
     * @tc.name      testExpUrlP0053
     * @tc.desc      URL path and query component 52 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p52?k=52&x=1#f52';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p52');
      expect(parsed.searchParams.get('k')).assertEqual('52');
      expect(parsed.hash).assertEqual('#f52');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0054
     * @tc.name      testExpUrlP0054
     * @tc.desc      URL path and query component 53 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p53?k=53&x=1#f53';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p53');
      expect(parsed.searchParams.get('k')).assertEqual('53');
      expect(parsed.hash).assertEqual('#f53');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0055
     * @tc.name      testExpUrlP0055
     * @tc.desc      URL path and query component 54 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p54?k=54&x=1#f54';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p54');
      expect(parsed.searchParams.get('k')).assertEqual('54');
      expect(parsed.hash).assertEqual('#f54');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0056
     * @tc.name      testExpUrlP0056
     * @tc.desc      URL path and query component 55 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p55?k=55&x=1#f55';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p55');
      expect(parsed.searchParams.get('k')).assertEqual('55');
      expect(parsed.hash).assertEqual('#f55');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0057
     * @tc.name      testExpUrlP0057
     * @tc.desc      URL path and query component 56 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p56?k=56&x=1#f56';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p56');
      expect(parsed.searchParams.get('k')).assertEqual('56');
      expect(parsed.hash).assertEqual('#f56');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0058
     * @tc.name      testExpUrlP0058
     * @tc.desc      URL path and query component 57 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p57?k=57&x=1#f57';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p57');
      expect(parsed.searchParams.get('k')).assertEqual('57');
      expect(parsed.hash).assertEqual('#f57');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0059
     * @tc.name      testExpUrlP0059
     * @tc.desc      URL path and query component 58 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p58?k=58&x=1#f58';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p58');
      expect(parsed.searchParams.get('k')).assertEqual('58');
      expect(parsed.hash).assertEqual('#f58');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0060
     * @tc.name      testExpUrlP0060
     * @tc.desc      URL path and query component 59 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p59?k=59&x=1#f59';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p59');
      expect(parsed.searchParams.get('k')).assertEqual('59');
      expect(parsed.hash).assertEqual('#f59');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0061
     * @tc.name      testExpUrlP0061
     * @tc.desc      URL path and query component 60 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p60?k=60&x=1#f60';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p60');
      expect(parsed.searchParams.get('k')).assertEqual('60');
      expect(parsed.hash).assertEqual('#f60');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0062
     * @tc.name      testExpUrlP0062
     * @tc.desc      URL path and query component 61 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p61?k=61&x=1#f61';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p61');
      expect(parsed.searchParams.get('k')).assertEqual('61');
      expect(parsed.hash).assertEqual('#f61');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0063
     * @tc.name      testExpUrlP0063
     * @tc.desc      URL path and query component 62 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p62?k=62&x=1#f62';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p62');
      expect(parsed.searchParams.get('k')).assertEqual('62');
      expect(parsed.hash).assertEqual('#f62');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0064
     * @tc.name      testExpUrlP0064
     * @tc.desc      URL path and query component 63 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p63?k=63&x=1#f63';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p63');
      expect(parsed.searchParams.get('k')).assertEqual('63');
      expect(parsed.hash).assertEqual('#f63');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0065
     * @tc.name      testExpUrlP0065
     * @tc.desc      URL path and query component 64 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p64?k=64&x=1#f64';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p64');
      expect(parsed.searchParams.get('k')).assertEqual('64');
      expect(parsed.hash).assertEqual('#f64');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0066
     * @tc.name      testExpUrlP0066
     * @tc.desc      URL path and query component 65 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p65?k=65&x=1#f65';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p65');
      expect(parsed.searchParams.get('k')).assertEqual('65');
      expect(parsed.hash).assertEqual('#f65');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0067
     * @tc.name      testExpUrlP0067
     * @tc.desc      URL path and query component 66 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p66?k=66&x=1#f66';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p66');
      expect(parsed.searchParams.get('k')).assertEqual('66');
      expect(parsed.hash).assertEqual('#f66');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0068
     * @tc.name      testExpUrlP0068
     * @tc.desc      URL path and query component 67 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p67?k=67&x=1#f67';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p67');
      expect(parsed.searchParams.get('k')).assertEqual('67');
      expect(parsed.hash).assertEqual('#f67');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0069
     * @tc.name      testExpUrlP0069
     * @tc.desc      URL path and query component 68 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p68?k=68&x=1#f68';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p68');
      expect(parsed.searchParams.get('k')).assertEqual('68');
      expect(parsed.hash).assertEqual('#f68');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0070
     * @tc.name      testExpUrlP0070
     * @tc.desc      URL path and query component 69 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p69?k=69&x=1#f69';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p69');
      expect(parsed.searchParams.get('k')).assertEqual('69');
      expect(parsed.hash).assertEqual('#f69');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0071
     * @tc.name      testExpUrlP0071
     * @tc.desc      URL path and query component 70 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p70?k=70&x=1#f70';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p70');
      expect(parsed.searchParams.get('k')).assertEqual('70');
      expect(parsed.hash).assertEqual('#f70');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0072
     * @tc.name      testExpUrlP0072
     * @tc.desc      URL path and query component 71 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p71?k=71&x=1#f71';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p71');
      expect(parsed.searchParams.get('k')).assertEqual('71');
      expect(parsed.hash).assertEqual('#f71');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0073
     * @tc.name      testExpUrlP0073
     * @tc.desc      URL path and query component 72 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p72?k=72&x=1#f72';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p72');
      expect(parsed.searchParams.get('k')).assertEqual('72');
      expect(parsed.hash).assertEqual('#f72');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0074
     * @tc.name      testExpUrlP0074
     * @tc.desc      URL path and query component 73 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p73?k=73&x=1#f73';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p73');
      expect(parsed.searchParams.get('k')).assertEqual('73');
      expect(parsed.hash).assertEqual('#f73');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0075
     * @tc.name      testExpUrlP0075
     * @tc.desc      URL path and query component 74 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p74?k=74&x=1#f74';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p74');
      expect(parsed.searchParams.get('k')).assertEqual('74');
      expect(parsed.hash).assertEqual('#f74');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0076
     * @tc.name      testExpUrlP0076
     * @tc.desc      URL path and query component 75 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p75?k=75&x=1#f75';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p75');
      expect(parsed.searchParams.get('k')).assertEqual('75');
      expect(parsed.hash).assertEqual('#f75');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0077
     * @tc.name      testExpUrlP0077
     * @tc.desc      URL path and query component 76 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p76?k=76&x=1#f76';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p76');
      expect(parsed.searchParams.get('k')).assertEqual('76');
      expect(parsed.hash).assertEqual('#f76');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0078
     * @tc.name      testExpUrlP0078
     * @tc.desc      URL path and query component 77 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p77?k=77&x=1#f77';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p77');
      expect(parsed.searchParams.get('k')).assertEqual('77');
      expect(parsed.hash).assertEqual('#f77');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0079
     * @tc.name      testExpUrlP0079
     * @tc.desc      URL path and query component 78 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p78?k=78&x=1#f78';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p78');
      expect(parsed.searchParams.get('k')).assertEqual('78');
      expect(parsed.hash).assertEqual('#f78');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0080
     * @tc.name      testExpUrlP0080
     * @tc.desc      URL path and query component 79 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p79?k=79&x=1#f79';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p79');
      expect(parsed.searchParams.get('k')).assertEqual('79');
      expect(parsed.hash).assertEqual('#f79');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0081
     * @tc.name      testExpUrlP0081
     * @tc.desc      URL path and query component 80 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p80?k=80&x=1#f80';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p80');
      expect(parsed.searchParams.get('k')).assertEqual('80');
      expect(parsed.hash).assertEqual('#f80');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0082
     * @tc.name      testExpUrlP0082
     * @tc.desc      URL path and query component 81 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p81?k=81&x=1#f81';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p81');
      expect(parsed.searchParams.get('k')).assertEqual('81');
      expect(parsed.hash).assertEqual('#f81');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0083
     * @tc.name      testExpUrlP0083
     * @tc.desc      URL path and query component 82 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p82?k=82&x=1#f82';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p82');
      expect(parsed.searchParams.get('k')).assertEqual('82');
      expect(parsed.hash).assertEqual('#f82');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0084
     * @tc.name      testExpUrlP0084
     * @tc.desc      URL path and query component 83 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p83?k=83&x=1#f83';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p83');
      expect(parsed.searchParams.get('k')).assertEqual('83');
      expect(parsed.hash).assertEqual('#f83');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0085
     * @tc.name      testExpUrlP0085
     * @tc.desc      URL path and query component 84 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p84?k=84&x=1#f84';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p84');
      expect(parsed.searchParams.get('k')).assertEqual('84');
      expect(parsed.hash).assertEqual('#f84');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0086
     * @tc.name      testExpUrlP0086
     * @tc.desc      URL path and query component 85 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p85?k=85&x=1#f85';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p85');
      expect(parsed.searchParams.get('k')).assertEqual('85');
      expect(parsed.hash).assertEqual('#f85');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0087
     * @tc.name      testExpUrlP0087
     * @tc.desc      URL path and query component 86 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p86?k=86&x=1#f86';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p86');
      expect(parsed.searchParams.get('k')).assertEqual('86');
      expect(parsed.hash).assertEqual('#f86');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0088
     * @tc.name      testExpUrlP0088
     * @tc.desc      URL path and query component 87 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p87?k=87&x=1#f87';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p87');
      expect(parsed.searchParams.get('k')).assertEqual('87');
      expect(parsed.hash).assertEqual('#f87');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0089
     * @tc.name      testExpUrlP0089
     * @tc.desc      URL path and query component 88 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p88?k=88&x=1#f88';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p88');
      expect(parsed.searchParams.get('k')).assertEqual('88');
      expect(parsed.hash).assertEqual('#f88');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0090
     * @tc.name      testExpUrlP0090
     * @tc.desc      URL path and query component 89 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p89?k=89&x=1#f89';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p89');
      expect(parsed.searchParams.get('k')).assertEqual('89');
      expect(parsed.hash).assertEqual('#f89');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0091
     * @tc.name      testExpUrlP0091
     * @tc.desc      URL path and query component 90 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p90?k=90&x=1#f90';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p90');
      expect(parsed.searchParams.get('k')).assertEqual('90');
      expect(parsed.hash).assertEqual('#f90');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0092
     * @tc.name      testExpUrlP0092
     * @tc.desc      URL path and query component 91 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p91?k=91&x=1#f91';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p91');
      expect(parsed.searchParams.get('k')).assertEqual('91');
      expect(parsed.hash).assertEqual('#f91');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0093
     * @tc.name      testExpUrlP0093
     * @tc.desc      URL path and query component 92 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p92?k=92&x=1#f92';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p92');
      expect(parsed.searchParams.get('k')).assertEqual('92');
      expect(parsed.hash).assertEqual('#f92');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0094
     * @tc.name      testExpUrlP0094
     * @tc.desc      URL path and query component 93 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p93?k=93&x=1#f93';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p93');
      expect(parsed.searchParams.get('k')).assertEqual('93');
      expect(parsed.hash).assertEqual('#f93');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0095
     * @tc.name      testExpUrlP0095
     * @tc.desc      URL path and query component 94 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p94?k=94&x=1#f94';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p94');
      expect(parsed.searchParams.get('k')).assertEqual('94');
      expect(parsed.hash).assertEqual('#f94');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0096
     * @tc.name      testExpUrlP0096
     * @tc.desc      URL path and query component 95 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p95?k=95&x=1#f95';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p95');
      expect(parsed.searchParams.get('k')).assertEqual('95');
      expect(parsed.hash).assertEqual('#f95');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0097
     * @tc.name      testExpUrlP0097
     * @tc.desc      URL path and query component 96 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p96?k=96&x=1#f96';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p96');
      expect(parsed.searchParams.get('k')).assertEqual('96');
      expect(parsed.hash).assertEqual('#f96');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0098
     * @tc.name      testExpUrlP0098
     * @tc.desc      URL path and query component 97 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p97?k=97&x=1#f97';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p97');
      expect(parsed.searchParams.get('k')).assertEqual('97');
      expect(parsed.hash).assertEqual('#f97');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0099
     * @tc.name      testExpUrlP0099
     * @tc.desc      URL path and query component 98 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p98?k=98&x=1#f98';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p98');
      expect(parsed.searchParams.get('k')).assertEqual('98');
      expect(parsed.hash).assertEqual('#f98');
      expect(parsed.href).assertEqual(source);
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLP_0100
     * @tc.name      testExpUrlP0100
     * @tc.desc      URL path and query component 99 parse independently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = 'https://example.com/p99?k=99&x=1#f99';
      const parsed: url.URL = new url.URL(source);
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/p99');
      expect(parsed.searchParams.get('k')).assertEqual('99');
      expect(parsed.hash).assertEqual('#f99');
      expect(parsed.href).assertEqual(source);
    })
  })
}
