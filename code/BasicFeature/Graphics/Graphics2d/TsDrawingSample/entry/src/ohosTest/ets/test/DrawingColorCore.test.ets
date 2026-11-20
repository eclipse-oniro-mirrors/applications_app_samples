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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingColorCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

interface DrawingColor4 {
  alpha: number;
  red: number;
  green: number;
  blue: number;
}

function makeColor(alpha: number, red: number, green: number, blue: number): DrawingColor4 {
  const color: DrawingColor4 = { alpha: alpha, red: red, green: green, blue: blue };
  return color;
}

function hexDigitValue(ch: string): number {
  if (ch.length !== 1) {
    return -1;
  }
  const code: number = ch.charCodeAt(0);
  if (code >= 48 && code <= 57) {
    return code - 48;
  }
  if (code >= 97 && code <= 102) {
    return code - 87;
  }
  if (code >= 65 && code <= 70) {
    return code - 55;
  }
  return -1;
}

function parseHexColor(hex: string): DrawingColor4 {
  const invalid: DrawingColor4 = { alpha: 0, red: 0, green: 0, blue: 0 };
  let body: string = hex;
  if (body.length > 0 && body.charAt(0) === '#') {
    body = body.substring(1);
  }
  if (body.length !== 6 && body.length !== 8) {
    return invalid;
  }
  const values: number[] = [];
  for (let i: number = 0; i < body.length; i++) {
    const v: number = hexDigitValue(body.charAt(i));
    if (v < 0) {
      return invalid;
    }
    values.push(v);
  }
  if (body.length === 8) {
    const out8: DrawingColor4 = {
      alpha: values[0] * 16 + values[1],
      red: values[2] * 16 + values[3],
      green: values[4] * 16 + values[5],
      blue: values[6] * 16 + values[7]
    };
    return out8;
  }
  const out6: DrawingColor4 = {
    alpha: 255,
    red: values[0] * 16 + values[1],
    green: values[2] * 16 + values[3],
    blue: values[4] * 16 + values[5]
  };
  return out6;
}

function isValidHexColor(hex: string): boolean {
  let body: string = hex;
  if (body.length > 0 && body.charAt(0) === '#') {
    body = body.substring(1);
  }
  if (body.length !== 6 && body.length !== 8) {
    return false;
  }
  for (let i: number = 0; i < body.length; i++) {
    if (hexDigitValue(body.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

function toHex2(value: number): string {
  const digits: string = '0123456789ABCDEF';
  const hi: number = Math.floor(value / 16);
  const lo: number = value % 16;
  return digits.charAt(hi) + digits.charAt(lo);
}

function colorToHexString(color: DrawingColor4): string {
  return toHex2(color.alpha) + toHex2(color.red) + toHex2(color.green) + toHex2(color.blue);
}

export default function drawingColorCoreTest(): void {
  describe('DrawingColorCoreTest', () => {
    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0001
     * @tc.name      testDrawingColor0001
     * @tc.desc      Verify makeColor stores the pure red sample color fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0001 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0xFF, 0x00, 0x00);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0001 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0002
     * @tc.name      testDrawingColor0002
     * @tc.desc      Verify makeColor stores the pure blue sample color fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0002 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0x00, 0x00, 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0002 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0003
     * @tc.name      testDrawingColor0003
     * @tc.desc      Verify makeColor stores the sample title color 0xFF4472C3 fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0003 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0x44, 0x72, 0xC3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=68`);
      expect(color.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=114`);
      expect(color.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=195`);
      expect(color.blue).assertEqual(195);
      log('testDrawingColor0003 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0004
     * @tc.name      testDrawingColor0004
     * @tc.desc      Verify the parsed color model is an object type to prevent type degradation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0004 begin');
      const color: DrawingColor4 = makeColor(1, 2, 3, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color=${typeof color}, expected='object'`);
      expect(typeof color).assertEqual('object');
      log('testDrawingColor0004 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0005
     * @tc.name      testDrawingColor0005
     * @tc.desc      Verify every parsed color field keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0005 begin');
      const color: DrawingColor4 = makeColor(1, 2, 3, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.alpha=${typeof color.alpha}, expected='number'`);
      expect(typeof color.alpha).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.red=${typeof color.red}, expected='number'`);
      expect(typeof color.red).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.green=${typeof color.green}, expected='number'`);
      expect(typeof color.green).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.blue=${typeof color.blue}, expected='number'`);
      expect(typeof color.blue).assertEqual('number');
      log('testDrawingColor0005 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0006
     * @tc.name      testDrawingColor0006
     * @tc.desc      Verify a fully transparent color keeps alpha zero and channels intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0006 begin');
      const color: DrawingColor4 = makeColor(0, 255, 255, 255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0006 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0007
     * @tc.name      testDrawingColor0007
     * @tc.desc      Verify the maximum channel values are accepted and stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0007 begin');
      const color: DrawingColor4 = makeColor(255, 255, 255, 255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0007 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0008
     * @tc.name      testDrawingColor0008
     * @tc.desc      Verify two color model instances are independent value copies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0008 begin');
      const first: DrawingColor4 = makeColor(255, 0, 0, 0);
      const second: DrawingColor4 = makeColor(255, 0, 0, 0);
      first.red = 123;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.red=${second.red}, expected=0`);
      expect(second.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.red=${first.red}, expected=123`);
      expect(first.red).assertEqual(123);
      log('testDrawingColor0008 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0009
     * @tc.name      testDrawingColor0009
     * @tc.desc      Verify parsing six digit hex #FF0000 yields opaque red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0009 begin');
      const color: DrawingColor4 = parseHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0009 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0010
     * @tc.name      testDrawingColor0010
     * @tc.desc      Verify parsing six digit hex #00FF00 yields opaque green.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0010 begin');
      const color: DrawingColor4 = parseHexColor('#00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0010 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0011
     * @tc.name      testDrawingColor0011
     * @tc.desc      Verify parsing six digit hex #0000FF yields opaque blue.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0011 begin');
      const color: DrawingColor4 = parseHexColor('#0000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0011 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0012
     * @tc.name      testDrawingColor0012
     * @tc.desc      Verify parsing #FFFFFF yields opaque white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0012 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0012 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0013
     * @tc.name      testDrawingColor0013
     * @tc.desc      Verify parsing #000000 yields opaque black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0013 begin');
      const color: DrawingColor4 = parseHexColor('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0013 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0014
     * @tc.name      testDrawingColor0014
     * @tc.desc      Verify parsing mixed digit hex #123456 yields exact channel values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0014 begin');
      const color: DrawingColor4 = parseHexColor('#123456');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=18`);
      expect(color.red).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=52`);
      expect(color.green).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=86`);
      expect(color.blue).assertEqual(86);
      log('testDrawingColor0014 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0015
     * @tc.name      testDrawingColor0015
     * @tc.desc      Verify parsing upper case hex letters #ABCDEF yields exact values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0015 begin');
      const color: DrawingColor4 = parseHexColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=171`);
      expect(color.red).assertEqual(171);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=205`);
      expect(color.green).assertEqual(205);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=239`);
      expect(color.blue).assertEqual(239);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      log('testDrawingColor0015 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0016
     * @tc.name      testDrawingColor0016
     * @tc.desc      Verify lower case and upper case hex input produce the same color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0016 begin');
      const lower: DrawingColor4 = parseHexColor('#abcdef');
      const upper: DrawingColor4 = parseHexColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.red=${lower.red}, expected=upper.red`);
      expect(lower.red).assertEqual(upper.red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.green=${lower.green}, expected=upper.green`);
      expect(lower.green).assertEqual(upper.green);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.blue=${lower.blue}, expected=upper.blue`);
      expect(lower.blue).assertEqual(upper.blue);
      log('testDrawingColor0016 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0017
     * @tc.name      testDrawingColor0017
     * @tc.desc      Verify six digit hex without the hash prefix parses identically.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0017 begin');
      const plain: DrawingColor4 = parseHexColor('FF0000');
      const hashed: DrawingColor4 = parseHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.alpha=${plain.alpha}, expected=hashed.alpha`);
      expect(plain.alpha).assertEqual(hashed.alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.red=${plain.red}, expected=hashed.red`);
      expect(plain.red).assertEqual(hashed.red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.green=${plain.green}, expected=hashed.green`);
      expect(plain.green).assertEqual(hashed.green);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.blue=${plain.blue}, expected=hashed.blue`);
      expect(plain.blue).assertEqual(hashed.blue);
      log('testDrawingColor0017 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0018
     * @tc.name      testDrawingColor0018
     * @tc.desc      Verify parsing eight digit hex 80FF0000 yields semi transparent red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0018 begin');
      const color: DrawingColor4 = parseHexColor('80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0018 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0019
     * @tc.name      testDrawingColor0019
     * @tc.desc      Verify parsing eight digit hashed hex #80FF0000 yields alpha 128 red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0019 begin');
      const color: DrawingColor4 = parseHexColor('#80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0019 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0020
     * @tc.name      testDrawingColor0020
     * @tc.desc      Verify parsing fully transparent red #00FF0000 keeps alpha zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0020 begin');
      const color: DrawingColor4 = parseHexColor('#00FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0020 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0021
     * @tc.name      testDrawingColor0021
     * @tc.desc      Verify parsing #40FFFFFF yields alpha 64 white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0021 begin');
      const color: DrawingColor4 = parseHexColor('#40FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=64`);
      expect(color.alpha).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0021 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0022
     * @tc.name      testDrawingColor0022
     * @tc.desc      Verify parsing #C3123456 yields alpha 195 with exact channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0022 begin');
      const color: DrawingColor4 = parseHexColor('#C3123456');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=195`);
      expect(color.alpha).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=18`);
      expect(color.red).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=52`);
      expect(color.green).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=86`);
      expect(color.blue).assertEqual(86);
      log('testDrawingColor0022 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0023
     * @tc.name      testDrawingColor0023
     * @tc.desc      Verify parsing eight digit FF000000 without hash yields opaque black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0023 begin');
      const color: DrawingColor4 = parseHexColor('FF000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0023 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0024
     * @tc.name      testDrawingColor0024
     * @tc.desc      Verify an empty hex string parses to the all zero invalid color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0024 begin');
      const color: DrawingColor4 = parseHexColor('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0024 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0025
     * @tc.name      testDrawingColor0025
     * @tc.desc      Verify a lone hash prefix parses to the invalid color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0025 begin');
      const color: DrawingColor4 = parseHexColor('#');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0025 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0026
     * @tc.name      testDrawingColor0026
     * @tc.desc      Verify a three digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0026 begin');
      const color: DrawingColor4 = parseHexColor('#FFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0026 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0027
     * @tc.name      testDrawingColor0027
     * @tc.desc      Verify a four digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0027 begin');
      const color: DrawingColor4 = parseHexColor('#FFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0027 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0028
     * @tc.name      testDrawingColor0028
     * @tc.desc      Verify a five digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0028 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0028 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0029
     * @tc.name      testDrawingColor0029
     * @tc.desc      Verify a seven digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0029 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0029 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0030
     * @tc.name      testDrawingColor0030
     * @tc.desc      Verify a nine digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0030 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFF000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      log('testDrawingColor0030 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0031
     * @tc.name      testDrawingColor0031
     * @tc.desc      Verify non hex letters in the body are rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0031 begin');
      const color: DrawingColor4 = parseHexColor('#GGHHII');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0031 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0032
     * @tc.name      testDrawingColor0032
     * @tc.desc      Verify a named color word is rejected as invalid hex input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0032 begin');
      const color: DrawingColor4 = parseHexColor('red');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0032 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0033
     * @tc.name      testDrawingColor0033
     * @tc.desc      Verify embedded whitespace in hex input is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0033 begin');
      const color: DrawingColor4 = parseHexColor('#FF 000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0033 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0034
     * @tc.name      testDrawingColor0034
     * @tc.desc      Verify repeated hash prefixes make the body too long and invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0034 begin');
      const color: DrawingColor4 = parseHexColor('####FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0034 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0035
     * @tc.name      testDrawingColor0035
     * @tc.desc      Verify a single digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0035 begin');
      const color: DrawingColor4 = parseHexColor('#F');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0035 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0036
     * @tc.name      testDrawingColor0036
     * @tc.desc      Verify isValidHexColor accepts the six digit hashed form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0036 begin');
      const valid: boolean = isValidHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue valid=${valid}`);
      expect(valid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof valid=${typeof valid}, expected='boolean'`);
      expect(typeof valid).assertEqual('boolean');
      log('testDrawingColor0036 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0037
     * @tc.name      testDrawingColor0037
     * @tc.desc      Verify isValidHexColor accepts #00FF00.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0037 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#00FF00')=${isValidHexColor('#00FF00')}`);
      expect(isValidHexColor('#00FF00')).assertTrue();
      log('testDrawingColor0037 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0038
     * @tc.name      testDrawingColor0038
     * @tc.desc      Verify isValidHexColor accepts upper case letter hex #ABCDEF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0038 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#ABCDEF')=${isValidHexColor('#ABCDEF')}`);
      expect(isValidHexColor('#ABCDEF')).assertTrue();
      log('testDrawingColor0038 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0039
     * @tc.name      testDrawingColor0039
     * @tc.desc      Verify isValidHexColor accepts lower case letter hex.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0039 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#abcdef')=${isValidHexColor('#abcdef')}`);
      expect(isValidHexColor('#abcdef')).assertTrue();
      log('testDrawingColor0039 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0040
     * @tc.name      testDrawingColor0040
     * @tc.desc      Verify isValidHexColor accepts the hash free six digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0040 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('FF0000')=${isValidHexColor('FF0000')}`);
      expect(isValidHexColor('FF0000')).assertTrue();
      log('testDrawingColor0040 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0041
     * @tc.name      testDrawingColor0041
     * @tc.desc      Verify isValidHexColor accepts the eight digit alpha form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0041 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#80FF0000')=${isValidHexColor('#80FF0000')}`);
      expect(isValidHexColor('#80FF0000')).assertTrue();
      log('testDrawingColor0041 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0042
     * @tc.name      testDrawingColor0042
     * @tc.desc      Verify isValidHexColor rejects the empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0042 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('')=${isValidHexColor('')}`);
      expect(isValidHexColor('')).assertFalse();
      log('testDrawingColor0042 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0043
     * @tc.name      testDrawingColor0043
     * @tc.desc      Verify isValidHexColor rejects a lone hash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0043 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#')=${isValidHexColor('#')}`);
      expect(isValidHexColor('#')).assertFalse();
      log('testDrawingColor0043 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0044
     * @tc.name      testDrawingColor0044
     * @tc.desc      Verify isValidHexColor rejects the three digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0044 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FFF')=${isValidHexColor('#FFF')}`);
      expect(isValidHexColor('#FFF')).assertFalse();
      log('testDrawingColor0044 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0045
     * @tc.name      testDrawingColor0045
     * @tc.desc      Verify isValidHexColor rejects non hex letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0045 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#GGGGGG')=${isValidHexColor('#GGGGGG')}`);
      expect(isValidHexColor('#GGGGGG')).assertFalse();
      log('testDrawingColor0045 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0046
     * @tc.name      testDrawingColor0046
     * @tc.desc      Verify isValidHexColor rejects named color words.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0046 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('red')=${isValidHexColor('red')}`);
      expect(isValidHexColor('red')).assertFalse();
      log('testDrawingColor0046 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0047
     * @tc.name      testDrawingColor0047
     * @tc.desc      Verify isValidHexColor rejects hex containing whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0047 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FF00 0')=${isValidHexColor('#FF00 0')}`);
      expect(isValidHexColor('#FF00 0')).assertFalse();
      log('testDrawingColor0047 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0048
     * @tc.name      testDrawingColor0048
     * @tc.desc      Verify isValidHexColor rejects seven digit hex.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0048 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FF00000')=${isValidHexColor('#FF00000')}`);
      expect(isValidHexColor('#FF00000')).assertFalse();
      log('testDrawingColor0048 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0049
     * @tc.name      testDrawingColor0049
     * @tc.desc      Verify isValidHexColor accepts the hash free eight digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0049 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('FF000000')=${isValidHexColor('FF000000')}`);
      expect(isValidHexColor('FF000000')).assertTrue();
      log('testDrawingColor0049 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0050
     * @tc.name      testDrawingColor0050
     * @tc.desc      Verify isValidHexColor rejects a five digit body.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0050 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#12345')=${isValidHexColor('#12345')}`);
      expect(isValidHexColor('#12345')).assertFalse();
      log('testDrawingColor0050 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0051
     * @tc.name      testDrawingColor0051
     * @tc.desc      Verify serializing opaque red yields the AARRGGBB string FFFF0000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0051 begin');
      const text: string = colorToHexString(makeColor(255, 255, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='FFFF0000'`);
      expect(text).assertEqual('FFFF0000');
      log('testDrawingColor0051 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0052
     * @tc.name      testDrawingColor0052
     * @tc.desc      Verify serializing opaque white yields FFFFFFFF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0052 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(255, 255, 255, 255))}`);
      expect(colorToHexString(makeColor(255, 255, 255, 255))).assertEqual('FFFFFFFF');
      log('testDrawingColor0052 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0053
     * @tc.name      testDrawingColor0053
     * @tc.desc      Verify serializing opaque black yields FF000000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0053 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(255, 0, 0, 0))}`);
      expect(colorToHexString(makeColor(255, 0, 0, 0))).assertEqual('FF000000');
      log('testDrawingColor0053 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0054
     * @tc.name      testDrawingColor0054
     * @tc.desc      Verify serializing semi transparent blue yields 800000FF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0054 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(128, 0, 0, 255))}`);
      expect(colorToHexString(makeColor(128, 0, 0, 255))).assertEqual('800000FF');
      log('testDrawingColor0054 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0055
     * @tc.name      testDrawingColor0055
     * @tc.desc      Verify serializing transparent white yields 00FFFFFF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0055 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(0, 255, 255, 255))}`);
      expect(colorToHexString(makeColor(0, 255, 255, 255))).assertEqual('00FFFFFF');
      log('testDrawingColor0055 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0056
     * @tc.name      testDrawingColor0056
     * @tc.desc      Verify serializing the sample title color yields FF4472C3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0056 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(255, 68, 114, 195))}`);
      expect(colorToHexString(makeColor(255, 68, 114, 195))).assertEqual('FF4472C3');
      log('testDrawingColor0056 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0057
     * @tc.name      testDrawingColor0057
     * @tc.desc      Verify parse then serialize round trips #FF4472C3 unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0057 begin');
      const color: DrawingColor4 = parseHexColor('#FF4472C3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual colorToHexString(color)=${colorToHexString(color)}`);
      expect(colorToHexString(color)).assertEqual('FF4472C3');
      log('testDrawingColor0057 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0058
     * @tc.name      testDrawingColor0058
     * @tc.desc      Verify parse then serialize round trips 80FF0000 unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0058 begin');
      const color: DrawingColor4 = parseHexColor('80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual colorToHexString(color)=${colorToHexString(color)}`);
      expect(colorToHexString(color)).assertEqual('80FF0000');
      log('testDrawingColor0058 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0059
     * @tc.name      testDrawingColor0059
     * @tc.desc      Verify the serialized color string keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0059 begin');
      const text: string = colorToHexString(makeColor(1, 2, 3, 4));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testDrawingColor0059 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0060
     * @tc.name      testDrawingColor0060
     * @tc.desc      Verify serialized output is always eight characters long.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0060 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(1, 2, 3, 4))}`);
      expect(colorToHexString(makeColor(1, 2, 3, 4))).assertEqual('01020304');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${colorToHexString(makeColor(1, 2, 3, 4)).length}`);
      expect(colorToHexString(makeColor(1, 2, 3, 4)).length).assertEqual(8);
      log('testDrawingColor0060 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0061
     * @tc.name      testDrawingColor0061
     * @tc.desc      Verify a Pen can be created standalone for parameter modeling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0061 begin');
      const pen: drawing.Pen = new drawing.Pen();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== null=${pen !== null}`);
      expect(pen !== null).assertTrue();
      log('testDrawingColor0061 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0062
     * @tc.name      testDrawingColor0062
     * @tc.desc      Verify Pen setColor with the object form applies without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0062 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      pen.setColor(color);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0062 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0063
     * @tc.name      testDrawingColor0063
     * @tc.desc      Verify Pen getColor round trips the object form red color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0063 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      pen.setColor(color);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingColor0063 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0064
     * @tc.name      testDrawingColor0064
     * @tc.desc      Verify Pen getColor round trips the sample title color 0xFF4472C3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0064 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const color: common2D.Color = { alpha: 255, red: 68, green: 114, blue: 195 };
      pen.setColor(color);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=114`);
      expect(got.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=195`);
      expect(got.blue).assertEqual(195);
      log('testDrawingColor0064 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0065
     * @tc.name      testDrawingColor0065
     * @tc.desc      Verify Pen setColor four argument form round trips opaque blue.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0065 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(255, 0, 0, 255);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingColor0065 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0066
     * @tc.name      testDrawingColor0066
     * @tc.desc      Verify Pen setColor four argument form round trips the sample red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0066 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0xFF, 0x00, 0x00);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingColor0066 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0067
     * @tc.name      testDrawingColor0067
     * @tc.desc      Verify Pen setStrokeWidth with the sample width three applies safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0067 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setStrokeWidth(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0067 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0068
     * @tc.name      testDrawingColor0068
     * @tc.desc      Verify Pen setStrokeWidth with the sample width ten applies safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0068 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setStrokeWidth(10.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0068 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0069
     * @tc.name      testDrawingColor0069
     * @tc.desc      Verify Pen setAntiAlias true applies safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0069 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setAntiAlias(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0069 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0070
     * @tc.name      testDrawingColor0070
     * @tc.desc      Verify combined Pen color width and anti alias settings apply safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0070 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const color: common2D.Color = { alpha: 255, red: 68, green: 114, blue: 195 };
      pen.setColor(color);
      pen.setStrokeWidth(3);
      pen.setAntiAlias(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0070 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0071
     * @tc.name      testDrawingColor0071
     * @tc.desc      Verify Pen setColor packed number form applies without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0071 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF0000FF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0071 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0072
     * @tc.name      testDrawingColor0072
     * @tc.desc      Verify Pen reset applies without throwing after configuration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0072 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0xFF, 0x00, 0x00);
      pen.setStrokeWidth(10);
      pen.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pen !== undefined=${pen !== undefined}`);
      expect(pen !== undefined).assertTrue();
      log('testDrawingColor0072 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0073
     * @tc.name      testDrawingColor0073
     * @tc.desc      Verify a Brush can be created standalone for parameter modeling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0073 begin');
      const brush: drawing.Brush = new drawing.Brush();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue brush !== undefined=${brush !== undefined}`);
      expect(brush !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue brush !== null=${brush !== null}`);
      expect(brush !== null).assertTrue();
      log('testDrawingColor0073 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0074
     * @tc.name      testDrawingColor0074
     * @tc.desc      Verify Brush getColor round trips the object form blue color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0074 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const color: common2D.Color = { alpha: 255, red: 0, green: 0, blue: 255 };
      brush.setColor(color);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingColor0074 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0075
     * @tc.name      testDrawingColor0075
     * @tc.desc      Verify Brush getColor round trips the sample title color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0075 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const color: common2D.Color = { alpha: 255, red: 68, green: 114, blue: 195 };
      brush.setColor(color);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=114`);
      expect(got.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=195`);
      expect(got.blue).assertEqual(195);
      log('testDrawingColor0075 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0076
     * @tc.name      testDrawingColor0076
     * @tc.desc      Verify Brush setColor four argument form round trips opaque green.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0076 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(255, 0, 255, 0);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=255`);
      expect(got.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingColor0076 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0077
     * @tc.name      testDrawingColor0077
     * @tc.desc      Verify Brush setAntiAlias false applies safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0077 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setAntiAlias(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue brush !== undefined=${brush !== undefined}`);
      expect(brush !== undefined).assertTrue();
      log('testDrawingColor0077 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0078
     * @tc.name      testDrawingColor0078
     * @tc.desc      Verify Brush setColor packed number form applies without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0078 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFFFFFF00);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue brush !== undefined=${brush !== undefined}`);
      expect(brush !== undefined).assertTrue();
      log('testDrawingColor0078 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0079
     * @tc.name      testDrawingColor0079
     * @tc.desc      Verify Brush reset applies without throwing after configuration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0079 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFF, 0x00, 0x00, 0xFF);
      brush.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue brush !== undefined=${brush !== undefined}`);
      expect(brush !== undefined).assertTrue();
      log('testDrawingColor0079 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0080
     * @tc.name      testDrawingColor0080
     * @tc.desc      Verify parsed color fields stay numbers before feeding drawing APIs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0080 begin');
      const color: DrawingColor4 = parseHexColor('#4472C3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.alpha=${typeof color.alpha}, expected='number'`);
      expect(typeof color.alpha).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.red=${typeof color.red}, expected='number'`);
      expect(typeof color.red).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.green=${typeof color.green}, expected='number'`);
      expect(typeof color.green).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.blue=${typeof color.blue}, expected='number'`);
      expect(typeof color.blue).assertEqual('number');
      log('testDrawingColor0080 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0081
     * @tc.name      testDrawingColor0081
     * @tc.desc      Verify alpha 00 matrix cell parses transparent red exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0081 begin');
      const color: DrawingColor4 = parseHexColor('#00FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0081 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0082
     * @tc.name      testDrawingColor0082
     * @tc.desc      Verify alpha 40 matrix cell parses as sixty four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0082 begin');
      const color: DrawingColor4 = parseHexColor('#40FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=64`);
      expect(color.alpha).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0082 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0083
     * @tc.name      testDrawingColor0083
     * @tc.desc      Verify alpha 80 matrix cell parses as one hundred twenty eight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0083 begin');
      const color: DrawingColor4 = parseHexColor('#80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0083 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0084
     * @tc.name      testDrawingColor0084
     * @tc.desc      Verify alpha C0 matrix cell parses as one hundred ninety two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0084 begin');
      const color: DrawingColor4 = parseHexColor('#C0FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=192`);
      expect(color.alpha).assertEqual(192);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0084 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0085
     * @tc.name      testDrawingColor0085
     * @tc.desc      Verify alpha FF matrix cell parses as fully opaque.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0085 begin');
      const color: DrawingColor4 = parseHexColor('#FFFF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0085 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0086
     * @tc.name      testDrawingColor0086
     * @tc.desc      Verify the red channel zero cell of the alpha matrix parses exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0086 begin');
      const color: DrawingColor4 = parseHexColor('#8000FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0086 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0087
     * @tc.name      testDrawingColor0087
     * @tc.desc      Verify the blue channel cell of the alpha matrix parses exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0087 begin');
      const color: DrawingColor4 = parseHexColor('#800000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0087 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0088
     * @tc.name      testDrawingColor0088
     * @tc.desc      Verify the white cell of the alpha matrix parses exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0088 begin');
      const color: DrawingColor4 = parseHexColor('#80FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0088 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0089
     * @tc.name      testDrawingColor0089
     * @tc.desc      Verify the black cell of the alpha matrix parses exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0089 begin');
      const color: DrawingColor4 = parseHexColor('#80000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0089 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0090
     * @tc.name      testDrawingColor0090
     * @tc.desc      Verify odd nibble alpha 1F parses as thirty one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0090 begin');
      const color: DrawingColor4 = parseHexColor('#1FFF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=31`);
      expect(color.alpha).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0090 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0091
     * @tc.name      testDrawingColor0091
     * @tc.desc      Verify sample gradient color 0xFFFFFF00 maps to opaque yellow channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0091 begin');
      const packed: number = 0xFFFFFF00;
      const color: DrawingColor4 = makeColor((packed >>> 24) & 0xFF, (packed >>> 16) & 0xFF,
        (packed >>> 8) & 0xFF, packed & 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0091 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0092
     * @tc.name      testDrawingColor0092
     * @tc.desc      Verify sample gradient color 0xFFFF0000 maps to opaque red channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0092 begin');
      const packed: number = 0xFFFF0000;
      const color: DrawingColor4 = makeColor((packed >>> 24) & 0xFF, (packed >>> 16) & 0xFF,
        (packed >>> 8) & 0xFF, packed & 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0092 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0093
     * @tc.name      testDrawingColor0093
     * @tc.desc      Verify sample gradient color 0xFF0000FF maps to opaque blue channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0093 begin');
      const packed: number = 0xFF0000FF;
      const color: DrawingColor4 = makeColor((packed >>> 24) & 0xFF, (packed >>> 16) & 0xFF,
        (packed >>> 8) & 0xFF, packed & 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0093 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0094
     * @tc.name      testDrawingColor0094
     * @tc.desc      Verify sample shader color 0xFFF8FA12 maps to exact channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0094 begin');
      const packed: number = 0xFFF8FA12;
      const color: DrawingColor4 = makeColor((packed >>> 24) & 0xFF, (packed >>> 16) & 0xFF,
        (packed >>> 8) & 0xFF, packed & 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=248`);
      expect(color.red).assertEqual(248);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=250`);
      expect(color.green).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=18`);
      expect(color.blue).assertEqual(18);
      log('testDrawingColor0094 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0095
     * @tc.name      testDrawingColor0095
     * @tc.desc      Verify sample shader color 0xFFACC3DD maps to exact channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0095 begin');
      const packed: number = 0xFFACC3DD;
      const color: DrawingColor4 = makeColor((packed >>> 24) & 0xFF, (packed >>> 16) & 0xFF,
        (packed >>> 8) & 0xFF, packed & 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=172`);
      expect(color.red).assertEqual(172);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=195`);
      expect(color.green).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=221`);
      expect(color.blue).assertEqual(221);
      log('testDrawingColor0095 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0096
     * @tc.name      testDrawingColor0096
     * @tc.desc      Verify Pen round trips the sample cat eye color 0xFFFFCC00.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0096 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0xFF, 0xCC, 0x00);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=204`);
      expect(got.green).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingColor0096 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0097
     * @tc.name      testDrawingColor0097
     * @tc.desc      Verify Pen round trips the sample curve cyan color 0xFF00FFFF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0097 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0x00, 0xFF, 0xFF);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=255`);
      expect(got.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingColor0097 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0098
     * @tc.name      testDrawingColor0098
     * @tc.desc      Verify Brush round trips the sample background white color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0098 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFF, 0xFF, 0xFF, 0xFF);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=255`);
      expect(got.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingColor0098 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0099
     * @tc.name      testDrawingColor0099
     * @tc.desc      Verify Brush round trips the sample region cyan color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0099 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFF, 0x00, 0xFF, 0xFF);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=255`);
      expect(got.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingColor0099 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0100
     * @tc.name      testDrawingColor0100
     * @tc.desc      Verify makeColor and parseHexColor agree field by field for the title color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0100 begin');
      const built: DrawingColor4 = makeColor(255, 68, 114, 195);
      const parsed: DrawingColor4 = parseHexColor('#FF4472C3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual built.alpha=${built.alpha}, expected=parsed.alpha`);
      expect(built.alpha).assertEqual(parsed.alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual built.red=${built.red}, expected=parsed.red`);
      expect(built.red).assertEqual(parsed.red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual built.green=${built.green}, expected=parsed.green`);
      expect(built.green).assertEqual(parsed.green);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual built.blue=${built.blue}, expected=parsed.blue`);
      expect(built.blue).assertEqual(parsed.blue);
      log('testDrawingColor0100 end');
    })
  })
}
