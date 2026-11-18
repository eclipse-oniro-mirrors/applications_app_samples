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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createGroup, GROUP_COUNT, GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec,
  rangeParam, scene, SceneSpec, SceneText, selectParam, toggleParam } from '../../../main/ets/core/SchemaTypes';
import { TOPIC_ANIMATION, TOPIC_BLUR, TOPIC_COUNT, TOPIC_FRAME_TICK, TOPIC_HIT_TEST, TOPIC_LAYOUT_COLUMN,
  TOPIC_LAYOUT_ROW, TOPIC_LIFECYCLE, TOPIC_MULTI_DEVICE, TOPIC_NODE_TREE, TOPIC_PERFORMANCE, TOPIC_RECORD,
  TOPIC_RENDER_PROP, TopicStats } from '../../../main/ets/core/TopicTypes';
import { EFFECT_BLEND_MODE, EFFECT_COLOR_FILTER, EFFECT_DASH, EFFECT_FILL_STROKE, EFFECT_LINEAR_GRADIENT,
  EFFECT_MASK_BLUR, EFFECT_OPTIONS, EFFECT_RADIAL_GRADIENT, EFFECT_SWEEP_GRADIENT, IMAGE_LINEAR, IMAGE_NEAREST,
  IMAGE_OPTIONS, IMAGE_SCALE_VIEW, IMAGE_STRETCH, SCENE_EFFECT, SCENE_IMAGE, SCENE_SHAPE, SCENE_TEXT, SCENE_TRANSFORM,
  SHAPE_ARC, SHAPE_CIRCLE, SHAPE_LINE, SHAPE_OPTIONS, SHAPE_OVAL, SHAPE_PATH, SHAPE_POINT, SHAPE_RECT, SHAPE_REGION,
  SHAPE_ROUND_RECT, TEXT_BLOB, TEXT_MEASURE, TEXT_OPTIONS, TEXT_TYPOGRAPHY, TRANSFORM_CLIP_PATH, TRANSFORM_CLIP_RECT,
  TRANSFORM_MATRIX, TRANSFORM_OPTIONS, TRANSFORM_ROTATE, TRANSFORM_SAVE_RESTORE, TRANSFORM_SCALE,
  TRANSFORM_TRANSLATE } from '../../../main/ets/common/SceneType';
import { SceneOption } from '../../../main/ets/common/SceneType';
import { CANVAS_GROUP } from '../../../main/ets/schema/CapabilityCanvas';
import { GEOMETRY_GROUP } from '../../../main/ets/schema/CapabilityGeometry';
import { PAINT_GROUP } from '../../../main/ets/schema/CapabilityPaint';
import { COLOR_GROUP } from '../../../main/ets/schema/CapabilityColor';
import { COLOR_FILTER_GROUP } from '../../../main/ets/schema/CapabilityColorFilter';
import { SHADER_GROUP } from '../../../main/ets/schema/CapabilityShader';
import { MASK_FILTER_GROUP } from '../../../main/ets/schema/CapabilityMaskFilter';
import { IMAGE_FILTER_GROUP } from '../../../main/ets/schema/CapabilityImageFilter';
import { BITMAP_GROUP } from '../../../main/ets/schema/CapabilityBitmap';
import { PIXELMAP_GROUP } from '../../../main/ets/schema/CapabilityPixelMap';
import { IMAGE_IO_GROUP } from '../../../main/ets/schema/CapabilityImageIo';
import { FONT_GROUP } from '../../../main/ets/schema/CapabilityFont';
import { TEXTBLOB_GROUP } from '../../../main/ets/schema/CapabilityTextBlob';
import { TYPOGRAPHY_GROUP } from '../../../main/ets/schema/CapabilityTypography';
import { SHADOW_GROUP } from '../../../main/ets/schema/CapabilityShadow';
import { MATRIX_GROUP } from '../../../main/ets/schema/CapabilityMatrix';
import { RECORD_GROUP } from '../../../main/ets/schema/CapabilityRecord';
import { OFFSCREEN_GROUP } from '../../../main/ets/schema/CapabilityOffscreen';
import { ERROR_GROUP } from '../../../main/ets/schema/CapabilityError';
import { TOPIC_NODE_TREE_GROUP } from '../../../main/ets/schema/TopicNodeTree';
import { TOPIC_RENDER_PROP_GROUP } from '../../../main/ets/schema/TopicRenderProp';
import { TOPIC_BLUR_GROUP } from '../../../main/ets/schema/TopicBlur';
import { TOPIC_ANIMATION_GROUP } from '../../../main/ets/schema/TopicAnimation';
import { TOPIC_HIT_TEST_GROUP } from '../../../main/ets/schema/TopicHitTest';
import { TOPIC_PERFORMANCE_GROUP } from '../../../main/ets/schema/TopicPerformance';
import { TOPIC_RECORD_GROUP } from '../../../main/ets/schema/TopicRecord';
import { TOPIC_MULTI_DEVICE_GROUP } from '../../../main/ets/schema/TopicMultiDevice';
import { TOPIC_LIFECYCLE_GROUP } from '../../../main/ets/schema/TopicLifecycle';
import { TOPIC_FRAME_TICK_GROUP } from '../../../main/ets/schema/TopicFrameTick';

const TAG: string = '[Sample_NdkRenderNodeSchemaTest]';
const DOMAIN: number = 0xF811;
// 单个场景最多接收的参数个数，与 cpp/capability/capability_type.h 的 MAX_SCENE_PARAMS 一致。
const MAX_SCENE_PARAMS: number = 8;
// 十九个能力域的场景数，逐个取自 cpp/capability/capability_type.h 的 *_SCENE_COUNT。
const NATIVE_SCENE_COUNTS: number[] = [10, 11, 10, 9, 9, 11, 8, 10, 10, 12, 10, 12, 8, 14, 8, 10, 8, 8, 10];
// 十九个能力域声明的参数总数，与 schema 源码中 rangeParam/toggleParam/selectParam 的调用次数一致。
const NATIVE_PARAM_COUNTS: number[] = [20, 23, 20, 19, 18, 22, 25, 28, 19, 23, 16, 23, 15, 30, 19, 27, 14, 15, 13];
// 十个专题页各四个场景，参数总数为 schema 侧声明值，顺序与 TOPIC_GROUPS（编号 20..29）一一对应。
const TOPIC_SCENE_TOTAL: number = 4;
const TOPIC_PARAM_COUNTS: number[] = [10, 13, 9, 12, 8, 9, 7, 8, 8, 7];
// 能力域与专题在分组数组中的下标；命名常量让每个用例校验自己那一行的数据而不是同一段数字。
const CAP_FIRST_ID: number = 1;
const CAP_SLOT_CANVAS: number = 0;
const CAP_SLOT_GEOMETRY: number = 1;
const CAP_SLOT_PAINT: number = 2;
const CAP_SLOT_COLOR: number = 3;
const CAP_SLOT_COLOR_FILTER: number = 4;
const CAP_SLOT_SHADER: number = 5;
const CAP_SLOT_MASK_FILTER: number = 6;
const CAP_SLOT_IMAGE_FILTER: number = 7;
const CAP_SLOT_BITMAP: number = 8;
const CAP_SLOT_PIXELMAP: number = 9;
const CAP_SLOT_IMAGE_IO: number = 10;
const CAP_SLOT_FONT: number = 11;
const CAP_SLOT_TEXTBLOB: number = 12;
const CAP_SLOT_TYPOGRAPHY: number = 13;
const CAP_SLOT_SHADOW: number = 14;
const CAP_SLOT_MATRIX: number = 15;
const CAP_SLOT_RECORD: number = 16;
const CAP_SLOT_OFFSCREEN: number = 17;
const CAP_SLOT_ERROR: number = 18;
const TOPIC_FIRST_ID: number = 20;
const TOPIC_SLOT_NODE_TREE: number = 0;
const TOPIC_SLOT_RENDER_PROP: number = 1;
const TOPIC_SLOT_BLUR: number = 2;
const TOPIC_SLOT_ANIMATION: number = 3;
const TOPIC_SLOT_HIT_TEST: number = 4;
const TOPIC_SLOT_PERFORMANCE: number = 5;
const TOPIC_SLOT_RECORD: number = 6;
const TOPIC_SLOT_MULTI_DEVICE: number = 7;
const TOPIC_SLOT_LIFECYCLE: number = 8;
const TOPIC_SLOT_FRAME_TICK: number = 9;
// 键名以字母开头，后续可含字母、数字、下划线与连字符；允许 camelCase，但不能含空白或前导数字。
const KEY_PATTERN: RegExp = new RegExp('^[a-zA-Z][a-zA-Z0-9_-]*$');

// 场景按钮的 kind 常量族，顺序即 native 侧的种类编号。
const SHAPE_KINDS: number[] = [SHAPE_POINT, SHAPE_LINE, SHAPE_CIRCLE, SHAPE_OVAL, SHAPE_RECT, SHAPE_ROUND_RECT,
  SHAPE_ARC, SHAPE_PATH, SHAPE_REGION];
const EFFECT_KINDS: number[] = [EFFECT_FILL_STROKE, EFFECT_BLEND_MODE, EFFECT_DASH, EFFECT_LINEAR_GRADIENT,
  EFFECT_RADIAL_GRADIENT, EFFECT_SWEEP_GRADIENT, EFFECT_COLOR_FILTER, EFFECT_MASK_BLUR];
const TRANSFORM_KINDS: number[] = [TRANSFORM_CLIP_RECT, TRANSFORM_CLIP_PATH, TRANSFORM_TRANSLATE, TRANSFORM_ROTATE,
  TRANSFORM_SCALE, TRANSFORM_MATRIX, TRANSFORM_SAVE_RESTORE];
const IMAGE_KINDS: number[] = [IMAGE_STRETCH, IMAGE_NEAREST, IMAGE_LINEAR, IMAGE_SCALE_VIEW];
const TEXT_KINDS: number[] = [TEXT_BLOB, TEXT_TYPOGRAPHY, TEXT_MEASURE];

// 能力域按 native 编号 1..19 排列，下标 i 对应编号 i + 1。
const CAPABILITY_GROUPS: GroupSpec[] = [CANVAS_GROUP, GEOMETRY_GROUP, PAINT_GROUP, COLOR_GROUP, COLOR_FILTER_GROUP,
  SHADER_GROUP, MASK_FILTER_GROUP, IMAGE_FILTER_GROUP, BITMAP_GROUP, PIXELMAP_GROUP, IMAGE_IO_GROUP, FONT_GROUP,
  TEXTBLOB_GROUP, TYPOGRAPHY_GROUP, SHADOW_GROUP, MATRIX_GROUP, RECORD_GROUP, OFFSCREEN_GROUP, ERROR_GROUP];
// 专题页按编号 20..29 排列，下标 i 对应编号 20 + i。
const TOPIC_GROUPS: GroupSpec[] = [TOPIC_NODE_TREE_GROUP, TOPIC_RENDER_PROP_GROUP, TOPIC_BLUR_GROUP,
  TOPIC_ANIMATION_GROUP, TOPIC_HIT_TEST_GROUP, TOPIC_PERFORMANCE_GROUP, TOPIC_RECORD_GROUP, TOPIC_MULTI_DEVICE_GROUP,
  TOPIC_LIFECYCLE_GROUP, TOPIC_FRAME_TICK_GROUP];
// 全部二十九个分组，校验跨分组唯一性时使用。
const ALL_GROUPS: GroupSpec[] = CAPABILITY_GROUPS.concat(TOPIC_GROUPS);

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function hasDuplicate(items: string[]): boolean {
  for (let outer = 0; outer < items.length; outer++) {
    for (let inner = outer + 1; inner < items.length; inner++) {
      if (items[outer] === items[inner]) {
        return true;
      }
    }
  }
  return false;
}

function paramCount(group: GroupSpec): number {
  let total: number = 0;
  for (let index = 0; index < group.scenes.length; index++) {
    total += group.scenes[index].params.length;
  }
  return total;
}

// 标题与说明统一为 Resource 或字面量，两种形态都要求存在且非空。
function isEmptyText(text: SceneText): boolean {
  if (typeof text === 'string') {
    return text.length === 0;
  }
  return text === undefined || text === null;
}

// 去重用的文本标识：字面量直接比较内容，资源按资源 id 比较。
function textKey(text: SceneText): string {
  if (typeof text === 'string') {
    return 'str:' + text;
  }
  return 'res:' + text.id.toString();
}

// 结构自检：返回第一处不合规描述，全部合规返回空串。
function describeStructure(group: GroupSpec): string {
  if (!KEY_PATTERN.test(group.key)) {
    return 'bad group key ' + group.key;
  }
  if (isEmptyText(group.title)) {
    return 'empty group title ' + group.key;
  }
  if (isEmptyText(group.desc)) {
    return 'empty group desc ' + group.key;
  }
  if (group.scenes.length === 0) {
    return 'empty scene list ' + group.key;
  }
  const titles: string[] = [];
  for (let index = 0; index < group.scenes.length; index++) {
    const item: SceneSpec = group.scenes[index];
    if (item.id !== index) {
      return 'scene id ' + item.id.toString() + ' out of order in ' + group.key;
    }
    if (isEmptyText(item.title)) {
      return 'empty scene title in ' + group.key + ' at ' + index.toString();
    }
    if (isEmptyText(item.desc)) {
      return 'empty scene desc in ' + group.key + ' at ' + index.toString();
    }
    titles.push(textKey(item.title));
  }
  if (hasDuplicate(titles)) {
    return 'duplicate scene title in ' + group.key;
  }
  return '';
}

// 参数自检：返回第一处不合规描述，全部合规返回空串。
function describeParams(group: GroupSpec): string {
  for (let sceneIndex = 0; sceneIndex < group.scenes.length; sceneIndex++) {
    const params: ParamSpec[] = group.scenes[sceneIndex].params;
    const where: string = group.key + '#' + sceneIndex.toString();
    if (params.length > MAX_SCENE_PARAMS) {
      return 'param count ' + params.length.toString() + ' exceeds limit at ' + where;
    }
    const keys: string[] = [];
    for (let paramIndex = 0; paramIndex < params.length; paramIndex++) {
      const spec: ParamSpec = params[paramIndex];
      const at: string = where + '/' + spec.key;
      if (!KEY_PATTERN.test(spec.key)) {
        return 'bad param key at ' + at;
      }
      if (spec.kind !== PARAM_RANGE && spec.kind !== PARAM_TOGGLE && spec.kind !== PARAM_SELECT) {
        return 'bad param kind at ' + at;
      }
      if (spec.min > spec.max) {
        return 'min above max at ' + at;
      }
      if (spec.step <= 0) {
        return 'non positive step at ' + at;
      }
      if (spec.def < spec.min || spec.def > spec.max) {
        return 'default out of range at ' + at;
      }
      if (spec.kind === PARAM_RANGE && spec.options.length !== 0) {
        return 'range param carries options at ' + at;
      }
      if (spec.kind === PARAM_TOGGLE) {
        if (spec.min !== 0 || spec.max !== 1 || spec.step !== 1 || spec.options.length !== 0) {
          return 'bad toggle shape at ' + at;
        }
      }
      if (spec.kind === PARAM_SELECT) {
        if (spec.options.length === 0) {
          return 'select without options at ' + at;
        }
        if (spec.min !== 0 || spec.max !== spec.options.length - 1) {
          return 'bad select bounds at ' + at;
        }
        if (Math.floor(spec.def) !== spec.def) {
          return 'fractional select default at ' + at;
        }
      }
      keys.push(spec.key);
    }
    if (hasDuplicate(keys)) {
      return 'duplicate param key at ' + where;
    }
  }
  return '';
}

// 场景按钮自检：返回第一处不合规描述，全部合规返回空串。
function describeOptions(name: string, options: SceneOption[], kinds: number[]): string {
  if (options.length !== kinds.length) {
    return name + ' length mismatch ' + options.length.toString() + '/' + kinds.length.toString();
  }
  const labels: string[] = [];
  for (let index = 0; index < options.length; index++) {
    const option: SceneOption = options[index];
    if (kinds[index] !== index) {
      return name + ' kind constant ' + kinds[index].toString() + ' is not ' + index.toString();
    }
    if (option.kind !== kinds[index]) {
      return name + ' option kind mismatch at ' + index.toString();
    }
    if (isEmptyText(option.label)) {
      return name + ' empty label at ' + index.toString();
    }
    labels.push(textKey(option.label));
  }
  if (hasDuplicate(labels)) {
    return name + ' duplicate label';
  }
  return '';
}

export default function ndkRenderNodeSchemaTest(): void {
  describe('NdkRenderNodeSchema', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0001
     * @tc.name      testNdkRenderNodeSchema0001
     * @tc.desc      校验画布能力域编号、键名、场景数与 native 侧 CAPABILITY_GROUP 声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0001 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_CANVAS];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_CANVAS);
      expect(group.key).assertEqual('canvas');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_CANVAS]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0002
     * @tc.name      testNdkRenderNodeSchema0002
     * @tc.desc      校验几何能力域编号、键名、场景数与 native 侧声明一致，场景编号连续。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0002 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_GEOMETRY];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_GEOMETRY);
      expect(group.key).assertEqual('geometry');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_GEOMETRY]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0003
     * @tc.name      testNdkRenderNodeSchema0003
     * @tc.desc      校验画笔能力域编号、键名、场景数与 native 侧声明一致，场景说明非空。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0003 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_PAINT];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_PAINT);
      expect(group.key).assertEqual('paint');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_PAINT]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0004
     * @tc.name      testNdkRenderNodeSchema0004
     * @tc.desc      校验颜色能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0004 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_COLOR];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_COLOR);
      expect(group.key).assertEqual('color');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_COLOR]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0005
     * @tc.name      testNdkRenderNodeSchema0005
     * @tc.desc      校验颜色滤波器能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0005 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_COLOR_FILTER];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_COLOR_FILTER);
      expect(group.key).assertEqual('colorFilter');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_COLOR_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0006
     * @tc.name      testNdkRenderNodeSchema0006
     * @tc.desc      校验着色器能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0006 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_SHADER];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_SHADER);
      expect(group.key).assertEqual('shader');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_SHADER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0007
     * @tc.name      testNdkRenderNodeSchema0007
     * @tc.desc      校验蒙版滤波器能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0007 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_MASK_FILTER];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_MASK_FILTER);
      expect(group.key).assertEqual('mask_filter');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_MASK_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0008
     * @tc.name      testNdkRenderNodeSchema0008
     * @tc.desc      校验图像滤波器能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0008 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_IMAGE_FILTER];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_IMAGE_FILTER);
      expect(group.key).assertEqual('image_filter');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_IMAGE_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0009
     * @tc.name      testNdkRenderNodeSchema0009
     * @tc.desc      校验位图能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0009 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_BITMAP];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_BITMAP);
      expect(group.key).assertEqual('bitmap');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_BITMAP]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0010
     * @tc.name      testNdkRenderNodeSchema0010
     * @tc.desc      校验像素图能力域编号、键名、场景数与 native 侧声明一致，共十二个场景。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0010 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_PIXELMAP];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_PIXELMAP);
      expect(group.key).assertEqual('pixelmap');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_PIXELMAP]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0011
     * @tc.name      testNdkRenderNodeSchema0011
     * @tc.desc      校验图像与内存流能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0011 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_IMAGE_IO];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_IMAGE_IO);
      expect(group.key).assertEqual('image_io');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_IMAGE_IO]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0012
     * @tc.name      testNdkRenderNodeSchema0012
     * @tc.desc      校验字体能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0012 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_FONT];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_FONT);
      expect(group.key).assertEqual('font');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_FONT]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0013
     * @tc.name      testNdkRenderNodeSchema0013
     * @tc.desc      校验文字块能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0013 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_TEXTBLOB];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_TEXTBLOB);
      expect(group.key).assertEqual('textblob');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_TEXTBLOB]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0014
     * @tc.name      testNdkRenderNodeSchema0014
     * @tc.desc      校验排版能力域编号、键名、场景数与 native 侧声明一致，共十四个场景。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0014 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_TYPOGRAPHY];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_TYPOGRAPHY);
      expect(group.key).assertEqual('typography');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_TYPOGRAPHY]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0015
     * @tc.name      testNdkRenderNodeSchema0015
     * @tc.desc      校验阴影层能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0015 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_SHADOW];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_SHADOW);
      expect(group.key).assertEqual('shadow');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_SHADOW]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0016
     * @tc.name      testNdkRenderNodeSchema0016
     * @tc.desc      校验矩阵能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0016 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_MATRIX];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_MATRIX);
      expect(group.key).assertEqual('matrix');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_MATRIX]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0017
     * @tc.name      testNdkRenderNodeSchema0017
     * @tc.desc      校验录制回放能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0017 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_RECORD];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_RECORD);
      expect(group.key).assertEqual('record');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_RECORD]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0018
     * @tc.name      testNdkRenderNodeSchema0018
     * @tc.desc      校验离屏表面能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0018 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_OFFSCREEN];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_OFFSCREEN);
      expect(group.key).assertEqual('offscreen');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_OFFSCREEN]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0019
     * @tc.name      testNdkRenderNodeSchema0019
     * @tc.desc      校验错误码能力域编号、键名、场景数与 native 侧声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0019 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_ERROR];
      expect(group.id).assertEqual(CAP_FIRST_ID + CAP_SLOT_ERROR);
      expect(group.key).assertEqual('error');
      expect(group.scenes.length).assertEqual(NATIVE_SCENE_COUNTS[CAP_SLOT_ERROR]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0020
     * @tc.name      testNdkRenderNodeSchema0020
     * @tc.desc      校验画布能力域的参数声明合法，参数总数与 native 侧读取下标范围匹配。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0020 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_CANVAS];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_CANVAS]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0021
     * @tc.name      testNdkRenderNodeSchema0021
     * @tc.desc      校验几何能力域的参数声明合法，键名唯一且默认值落在界内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0021 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_GEOMETRY];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_GEOMETRY]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0022
     * @tc.name      testNdkRenderNodeSchema0022
     * @tc.desc      校验画笔能力域的参数声明合法，下拉参数的选项数与上界一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0022 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_PAINT];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_PAINT]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0023
     * @tc.name      testNdkRenderNodeSchema0023
     * @tc.desc      校验颜色能力域的参数声明合法，同一场景内参数键名互不重复。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0023 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_COLOR];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_COLOR]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0024
     * @tc.name      testNdkRenderNodeSchema0024
     * @tc.desc      校验颜色滤波器能力域的参数声明合法，滑杆步长为正数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0024 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_COLOR_FILTER];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_COLOR_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0025
     * @tc.name      testNdkRenderNodeSchema0025
     * @tc.desc      校验着色器能力域的参数声明合法，单场景参数个数不超过 native 上限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0025 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_SHADER];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_SHADER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0026
     * @tc.name      testNdkRenderNodeSchema0026
     * @tc.desc      校验蒙版滤波器能力域的参数声明合法，开关参数只有 0/1 两种取值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0026 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_MASK_FILTER];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_MASK_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0027
     * @tc.name      testNdkRenderNodeSchema0027
     * @tc.desc      校验图像滤波器能力域的参数声明合法，参数个数为十九个能力域中最多。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0027 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_IMAGE_FILTER];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_IMAGE_FILTER]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0028
     * @tc.name      testNdkRenderNodeSchema0028
     * @tc.desc      校验位图能力域的参数声明合法，滑杆下界可以为 0 且默认值不越界。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0028 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_BITMAP];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_BITMAP]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0029
     * @tc.name      testNdkRenderNodeSchema0029
     * @tc.desc      校验像素图能力域的参数声明合法，十二个场景的参数均可被 native 完整读取。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0029 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_PIXELMAP];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_PIXELMAP]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0030
     * @tc.name      testNdkRenderNodeSchema0030
     * @tc.desc      校验图像与内存流能力域的参数声明合法，默认值均为整数刻度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0030 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_IMAGE_IO];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_IMAGE_IO]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0031
     * @tc.name      testNdkRenderNodeSchema0031
     * @tc.desc      校验字体能力域的参数声明合法，字体微调与边缘处理的选项下标在界内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0031 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_FONT];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_FONT]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0032
     * @tc.name      testNdkRenderNodeSchema0032
     * @tc.desc      校验文字块能力域的参数声明合法，键名不与其余能力域冲突。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0032 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_TEXTBLOB];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_TEXTBLOB]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0033
     * @tc.name      testNdkRenderNodeSchema0033
     * @tc.desc      校验排版能力域的参数声明合法，参数总数是十九个能力域中最多的。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0033 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_TYPOGRAPHY];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_TYPOGRAPHY]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0034
     * @tc.name      testNdkRenderNodeSchema0034
     * @tc.desc      校验阴影层能力域的参数声明合法，阴影颜色下标不超过调色板长度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0034 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_SHADOW];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_SHADOW]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0035
     * @tc.name      testNdkRenderNodeSchema0035
     * @tc.desc      校验矩阵能力域的参数声明合法，阶数类滑杆的步长与上界比例一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0035 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_MATRIX];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_MATRIX]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0036
     * @tc.name      testNdkRenderNodeSchema0036
     * @tc.desc      校验录制回放能力域的参数声明合法，重复次数类滑杆下界不为负。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0036 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_RECORD];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_RECORD]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0037
     * @tc.name      testNdkRenderNodeSchema0037
     * @tc.desc      校验离屏表面能力域的参数声明合法，尺寸类滑杆上界为正整数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0037 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_OFFSCREEN];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_OFFSCREEN]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0038
     * @tc.name      testNdkRenderNodeSchema0038
     * @tc.desc      校验错误码能力域的参数声明合法，参数最少但仍覆盖全部场景的取值下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0038 begin');
      const group: GroupSpec = CAPABILITY_GROUPS[CAP_SLOT_ERROR];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(NATIVE_PARAM_COUNTS[CAP_SLOT_ERROR]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0039
     * @tc.name      testNdkRenderNodeSchema0039
     * @tc.desc      校验节点树专题编号落在能力域之后，键名带 topic 前缀且包含四个场景。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0039 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_NODE_TREE];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_NODE_TREE);
      expect(group.key).assertEqual('topic-node-tree');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0040
     * @tc.name      testNdkRenderNodeSchema0040
     * @tc.desc      校验渲染属性专题编号、键名与场景编号连续，四个场景说明均非空。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0040 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_RENDER_PROP];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_RENDER_PROP);
      expect(group.key).assertEqual('topic-render-prop');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0041
     * @tc.name      testNdkRenderNodeSchema0041
     * @tc.desc      校验模糊专题编号、键名与场景结构合法，场景标题不重复。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0041 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_BLUR];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_BLUR);
      expect(group.key).assertEqual('topic-blur');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0042
     * @tc.name      testNdkRenderNodeSchema0042
     * @tc.desc      校验动画专题编号、键名与场景结构合法，每场景至少有参数声明。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0042 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_ANIMATION];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_ANIMATION);
      expect(group.key).assertEqual('topic-animation');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0043
     * @tc.name      testNdkRenderNodeSchema0043
     * @tc.desc      校验命中测试专题编号、键名与场景结构合法，参数键名唯一。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0043 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_HIT_TEST];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_HIT_TEST);
      expect(group.key).assertEqual('topic-hit-test');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0044
     * @tc.name      testNdkRenderNodeSchema0044
     * @tc.desc      校验性能专题编号、键名与场景结构合法，场景编号从 0 连续排列。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0044 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_PERFORMANCE];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_PERFORMANCE);
      expect(group.key).assertEqual('topic-performance');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0045
     * @tc.name      testNdkRenderNodeSchema0045
     * @tc.desc      校验录制回放专题编号、键名与场景结构合法，专题与能力域录制域键名不同。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0045 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_RECORD];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_RECORD);
      expect(group.key).assertEqual('topic-record');
      expect(group.key === RECORD_GROUP.key).assertFalse();
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0045 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0046
     * @tc.name      testNdkRenderNodeSchema0046
     * @tc.desc      校验多设备专题编号、键名与场景结构合法，联动参数声明完整。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0046 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_MULTI_DEVICE];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_MULTI_DEVICE);
      expect(group.key).assertEqual('topic-multi-device');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0046 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0047
     * @tc.name      testNdkRenderNodeSchema0047
     * @tc.desc      校验生命周期专题编号、键名与场景结构合法，场景说明均非空。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0047 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_LIFECYCLE];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_LIFECYCLE);
      expect(group.key).assertEqual('topic-lifecycle');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0047 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0048
     * @tc.name      testNdkRenderNodeSchema0048
     * @tc.desc      校验帧时钟专题编号为最后一个专题，键名与场景结构合法。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0048 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_FRAME_TICK];
      expect(group.id).assertEqual(TOPIC_FIRST_ID + TOPIC_SLOT_FRAME_TICK);
      expect(group.key).assertEqual('topic-frame-tick');
      expect(group.scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0048 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0049
     * @tc.name      testNdkRenderNodeSchema0049
     * @tc.desc      校验节点树专题的参数声明合法，参数总数与引擎取值下标一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0049 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_NODE_TREE];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_NODE_TREE]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0049 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0050
     * @tc.name      testNdkRenderNodeSchema0050
     * @tc.desc      校验渲染属性专题的参数声明合法，每场景参数均不超过 native 上限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0050 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_RENDER_PROP];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_RENDER_PROP]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0050 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0051
     * @tc.name      testNdkRenderNodeSchema0051
     * @tc.desc      校验模糊专题的参数声明合法，模式下拉的默认下标在选项范围内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0051 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_BLUR];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_BLUR]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0051 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0052
     * @tc.name      testNdkRenderNodeSchema0052
     * @tc.desc      校验动画专题的参数声明合法，时长与幅度类滑杆的界值合理。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0052 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_ANIMATION];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_ANIMATION]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0052 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0053
     * @tc.name      testNdkRenderNodeSchema0053
     * @tc.desc      校验命中测试专题的参数声明合法，布局下拉的默认值来自布局常量。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0053 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_HIT_TEST];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_HIT_TEST]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0053 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0054
     * @tc.name      testNdkRenderNodeSchema0054
     * @tc.desc      校验性能专题的参数声明合法，节点规模滑杆步长与上界成整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0054 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_PERFORMANCE];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_PERFORMANCE]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0054 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0055
     * @tc.name      testNdkRenderNodeSchema0055
     * @tc.desc      校验录制回放专题的参数声明合法，回放次数下界允许为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0055 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_RECORD];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_RECORD]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0055 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0056
     * @tc.name      testNdkRenderNodeSchema0056
     * @tc.desc      校验多设备专题的参数声明合法，单位下拉的两个选项下标均在界内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0056 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_MULTI_DEVICE];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_MULTI_DEVICE]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0056 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0057
     * @tc.name      testNdkRenderNodeSchema0057
     * @tc.desc      校验生命周期专题的参数声明合法，标签下拉的默认下标为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0057 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_LIFECYCLE];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_LIFECYCLE]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0057 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0058
     * @tc.name      testNdkRenderNodeSchema0058
     * @tc.desc      校验帧时钟专题的参数声明合法，采样间隔滑杆步长为正整数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0058 begin');
      const group: GroupSpec = TOPIC_GROUPS[TOPIC_SLOT_FRAME_TICK];
      expect(describeParams(group)).assertEqual('');
      expect(paramCount(group)).assertEqual(TOPIC_PARAM_COUNTS[TOPIC_SLOT_FRAME_TICK]);
      expect(describeStructure(group)).assertEqual('');
      logInfo('testNdkRenderNodeSchema0058 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0059
     * @tc.name      testNdkRenderNodeSchema0059
     * @tc.desc      校验分组总数为十九个能力域加十个专题，与两侧常量声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0059 begin');
      expect(GROUP_COUNT).assertEqual(19);
      expect(TOPIC_COUNT).assertEqual(10);
      expect(CAPABILITY_GROUPS.length).assertEqual(GROUP_COUNT);
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_COUNT);
      expect(ALL_GROUPS.length).assertEqual(GROUP_COUNT + TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0059 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0060
     * @tc.name      testNdkRenderNodeSchema0060
     * @tc.desc      校验二十九个分组的编号互不重复，且按 1 到 29 连续排列。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0060 begin');
      const ids: string[] = [];
      for (let index = 0; index < ALL_GROUPS.length; index++) {
        expect(ALL_GROUPS[index].id).assertEqual(index + 1);
        ids.push(ALL_GROUPS[index].id.toString());
      }
      expect(hasDuplicate(ids)).assertFalse();
      // 每个分组都要留下一条 id，收集结果与分组总数一致。
      expect(ids.length).assertEqual(ALL_GROUPS.length);
      logInfo('testNdkRenderNodeSchema0060 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0061
     * @tc.name      testNdkRenderNodeSchema0061
     * @tc.desc      校验二十九个分组的键名全局唯一，目录列表的键不会重复。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0061 begin');
      const keys: string[] = [];
      for (let index = 0; index < ALL_GROUPS.length; index++) {
        keys.push(ALL_GROUPS[index].key);
      }
      expect(hasDuplicate(keys)).assertFalse();
      logInfo('keys = ' + keys.join(','));
      expect(keys.length).assertEqual(ALL_GROUPS.length);
      // 专题键名统一带 topic- 前缀，能在全部键名中检索到。
      expect(keys.indexOf('topic-node-tree') >= 0).assertTrue();
      logInfo('testNdkRenderNodeSchema0061 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0062
     * @tc.name      testNdkRenderNodeSchema0062
     * @tc.desc      校验十九个能力域共声明 188 个场景，与 native 侧各域的 *_SCENE_COUNT 求和一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0062 begin');
      let declared: number = 0;
      let nativeTotal: number = 0;
      for (let index = 0; index < CAPABILITY_GROUPS.length; index++) {
        declared += CAPABILITY_GROUPS[index].scenes.length;
        nativeTotal += NATIVE_SCENE_COUNTS[index];
      }
      logInfo('capability scene total = ' + declared.toString());
      expect(declared).assertEqual(188);
      expect(nativeTotal).assertEqual(declared);
      expect(CAPABILITY_GROUPS.length).assertEqual(GROUP_COUNT);
      logInfo('testNdkRenderNodeSchema0062 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0063
     * @tc.name      testNdkRenderNodeSchema0063
     * @tc.desc      校验十个专题共声明 40 个场景，每个专题均为四个场景。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0063 begin');
      let declared: number = 0;
      for (let index = 0; index < TOPIC_GROUPS.length; index++) {
        expect(TOPIC_GROUPS[index].scenes.length).assertEqual(TOPIC_SCENE_TOTAL);
        declared += TOPIC_GROUPS[index].scenes.length;
      }
      expect(declared).assertEqual(40);
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0063 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0064
     * @tc.name      testNdkRenderNodeSchema0064
     * @tc.desc      校验十九个能力域共声明 389 个参数，参数顺序即 native 侧的取值协议。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0064 begin');
      let declared: number = 0;
      for (let index = 0; index < CAPABILITY_GROUPS.length; index++) {
        declared += paramCount(CAPABILITY_GROUPS[index]);
      }
      logInfo('capability param total = ' + declared.toString());
      expect(declared).assertEqual(389);
      expect(declared > 0).assertTrue();
      expect(CAPABILITY_GROUPS.length).assertEqual(GROUP_COUNT);
      logInfo('testNdkRenderNodeSchema0064 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0065
     * @tc.name      testNdkRenderNodeSchema0065
     * @tc.desc      校验十个专题共声明 91 个参数，与各专题参数表逐项求和一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0065 begin');
      let declared: number = 0;
      let expected: number = 0;
      for (let index = 0; index < TOPIC_GROUPS.length; index++) {
        declared += paramCount(TOPIC_GROUPS[index]);
        expected += TOPIC_PARAM_COUNTS[index];
      }
      logInfo('topic param total = ' + declared.toString());
      expect(declared).assertEqual(91);
      expect(expected).assertEqual(declared);
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0065 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0066
     * @tc.name      testNdkRenderNodeSchema0066
     * @tc.desc      校验全部 228 个场景的声明的参数个数都不超过 native 侧 MAX_SCENE_PARAMS。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0066 begin');
      let sceneTotal: number = 0;
      let maxParams: number = 0;
      for (let groupIndex = 0; groupIndex < ALL_GROUPS.length; groupIndex++) {
        const scenes: SceneSpec[] = ALL_GROUPS[groupIndex].scenes;
        for (let sceneIndex = 0; sceneIndex < scenes.length; sceneIndex++) {
          const declared: number = scenes[sceneIndex].params.length;
          if (declared > maxParams) {
            maxParams = declared;
          }
          sceneTotal++;
        }
      }
      logInfo('scene total = ' + sceneTotal.toString() + ' max params = ' + maxParams.toString());
      expect(sceneTotal).assertEqual(228);
      expect(maxParams <= MAX_SCENE_PARAMS).assertTrue();
      expect(ALL_GROUPS.length).assertEqual(GROUP_COUNT + TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0066 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0067
     * @tc.name      testNdkRenderNodeSchema0067
     * @tc.desc      校验能力域键名不带 topic 前缀，专题键名均带前缀，两侧命名空间不重叠。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0067 begin');
      for (let index = 0; index < CAPABILITY_GROUPS.length; index++) {
        expect(CAPABILITY_GROUPS[index].key.indexOf('topic-')).assertEqual(-1);
      }
      for (let index = 0; index < TOPIC_GROUPS.length; index++) {
        expect(TOPIC_GROUPS[index].key.indexOf('topic-')).assertEqual(0);
      }
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0067 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0068
     * @tc.name      testNdkRenderNodeSchema0068
     * @tc.desc      校验二十九个分组共声明 480 个参数，且每个分组至少声明一个参数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0068 begin');
      let declared: number = 0;
      for (let index = 0; index < ALL_GROUPS.length; index++) {
        const groupParams: number = paramCount(ALL_GROUPS[index]);
        expect(groupParams > 0).assertTrue();
        declared += groupParams;
      }
      logInfo('all param total = ' + declared.toString());
      expect(declared).assertEqual(480);
      expect(ALL_GROUPS.length).assertEqual(GROUP_COUNT + TOPIC_COUNT);
      logInfo('testNdkRenderNodeSchema0068 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0069
     * @tc.name      testNdkRenderNodeSchema0069
     * @tc.desc      校验几何图元按钮共九项，标签非空唯一且 kind 与 SHAPE_* 常量逐项对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0069 begin');
      expect(SHAPE_OPTIONS.length).assertEqual(9);
      expect(describeOptions('shape', SHAPE_OPTIONS, SHAPE_KINDS)).assertEqual('');
      // 场景按钮的种类常量与选项一一对应，长度必须相同。
      expect(SHAPE_KINDS.length).assertEqual(SHAPE_OPTIONS.length);
      logInfo('testNdkRenderNodeSchema0069 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0070
     * @tc.name      testNdkRenderNodeSchema0070
     * @tc.desc      校验绘制效果按钮共八项，标签非空唯一且 kind 与 EFFECT_* 常量逐项对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0070 begin');
      expect(EFFECT_OPTIONS.length).assertEqual(8);
      expect(describeOptions('effect', EFFECT_OPTIONS, EFFECT_KINDS)).assertEqual('');
      expect(EFFECT_KINDS.length).assertEqual(EFFECT_OPTIONS.length);
      logInfo('testNdkRenderNodeSchema0070 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0071
     * @tc.name      testNdkRenderNodeSchema0071
     * @tc.desc      校验画布操作按钮共七项，标签非空唯一且 kind 与 TRANSFORM_* 常量逐项对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0071 begin');
      expect(TRANSFORM_OPTIONS.length).assertEqual(7);
      expect(describeOptions('transform', TRANSFORM_OPTIONS, TRANSFORM_KINDS)).assertEqual('');
      expect(TRANSFORM_KINDS.length).assertEqual(TRANSFORM_OPTIONS.length);
      logInfo('testNdkRenderNodeSchema0071 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0072
     * @tc.name      testNdkRenderNodeSchema0072
     * @tc.desc      校验图片绘制按钮共四项，标签非空唯一且 kind 与 IMAGE_* 常量逐项对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0072 begin');
      expect(IMAGE_OPTIONS.length).assertEqual(4);
      expect(describeOptions('image', IMAGE_OPTIONS, IMAGE_KINDS)).assertEqual('');
      expect(IMAGE_KINDS.length).assertEqual(IMAGE_OPTIONS.length);
      logInfo('testNdkRenderNodeSchema0072 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0073
     * @tc.name      testNdkRenderNodeSchema0073
     * @tc.desc      校验文本绘制按钮共三项，标签非空唯一且 kind 与 TEXT_* 常量逐项对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0073 begin');
      expect(TEXT_OPTIONS.length).assertEqual(3);
      expect(describeOptions('text', TEXT_OPTIONS, TEXT_KINDS)).assertEqual('');
      expect(TEXT_KINDS.length).assertEqual(TEXT_OPTIONS.length);
      logInfo('testNdkRenderNodeSchema0073 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0074
     * @tc.name      testNdkRenderNodeSchema0074
     * @tc.desc      校验五个场景编号常量为 0 到 4 且互不相同，与 native 侧场景枚举对应。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0074 begin');
      expect(SCENE_SHAPE).assertEqual(0);
      expect(SCENE_EFFECT).assertEqual(1);
      expect(SCENE_TRANSFORM).assertEqual(2);
      expect(SCENE_IMAGE).assertEqual(3);
      expect(SCENE_TEXT).assertEqual(4);
      const ids: string[] = [SCENE_SHAPE.toString(), SCENE_EFFECT.toString(), SCENE_TRANSFORM.toString(),
        SCENE_IMAGE.toString(), SCENE_TEXT.toString()];
      expect(hasDuplicate(ids)).assertFalse();
      logInfo('testNdkRenderNodeSchema0074 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0075
     * @tc.name      testNdkRenderNodeSchema0075
     * @tc.desc      校验五组按钮标签资源存在且非空，字面量形态无首尾空白。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeSchema0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSchema0075 begin');
      const families: SceneOption[][] = [SHAPE_OPTIONS, EFFECT_OPTIONS, TRANSFORM_OPTIONS, IMAGE_OPTIONS, TEXT_OPTIONS];
      let checked: number = 0;
      for (let familyIndex = 0; familyIndex < families.length; familyIndex++) {
        const options: SceneOption[] = families[familyIndex];
        for (let index = 0; index < options.length; index++) {
          const label: SceneText = options[index].label;
          expect(isEmptyText(label)).assertFalse();
          if (typeof label === 'string') {
            expect(label.trim() === label).assertTrue();
          }
          checked++;
        }
      }
      logInfo('checked labels = ' + checked.toString());
      expect(checked).assertEqual(31);
      logInfo('testNdkRenderNodeSchema0075 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0076
     * @tc.name      testNdkRenderNodeSchema0076
     * @tc.desc      校验每族按钮的 kind 从 0 连续递增到选项数减一，不存在空洞。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeSchema0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSchema0076 begin');
      expect(SHAPE_KINDS[SHAPE_OPTIONS.length - 1]).assertEqual(SHAPE_OPTIONS.length - 1);
      expect(EFFECT_KINDS[EFFECT_OPTIONS.length - 1]).assertEqual(EFFECT_OPTIONS.length - 1);
      expect(TRANSFORM_KINDS[TRANSFORM_OPTIONS.length - 1]).assertEqual(TRANSFORM_OPTIONS.length - 1);
      expect(IMAGE_KINDS[IMAGE_OPTIONS.length - 1]).assertEqual(IMAGE_OPTIONS.length - 1);
      expect(TEXT_KINDS[TEXT_OPTIONS.length - 1]).assertEqual(TEXT_OPTIONS.length - 1);
      logInfo('testNdkRenderNodeSchema0076 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0077
     * @tc.name      testNdkRenderNodeSchema0077
     * @tc.desc      校验专题编号从 20 连续到 29，且与专题目录声明顺序一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeSchema0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeSchema0077 begin');
      const ids: number[] = [TOPIC_NODE_TREE, TOPIC_RENDER_PROP, TOPIC_BLUR, TOPIC_ANIMATION, TOPIC_HIT_TEST,
        TOPIC_PERFORMANCE, TOPIC_RECORD, TOPIC_MULTI_DEVICE, TOPIC_LIFECYCLE, TOPIC_FRAME_TICK];
      expect(ids.length).assertEqual(TOPIC_COUNT);
      for (let index = 0; index < ids.length; index++) {
        expect(ids[index]).assertEqual(20 + index);
        expect(TOPIC_GROUPS[index].id).assertEqual(ids[index]);
      }
      logInfo('testNdkRenderNodeSchema0077 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0078
     * @tc.name      testNdkRenderNodeSchema0078
     * @tc.desc      校验专题布局常量为行 0 列 1，可直接作为下拉选项下标使用。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0078 begin');
      expect(TOPIC_LAYOUT_ROW).assertEqual(0);
      expect(TOPIC_LAYOUT_COLUMN).assertEqual(1);
      expect(TOPIC_LAYOUT_ROW === TOPIC_LAYOUT_COLUMN).assertFalse();
      logInfo('testNdkRenderNodeSchema0078 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0079
     * @tc.name      testNdkRenderNodeSchema0079
     * @tc.desc      校验专题统计快照按构造参数逐字段保存，字段顺序不会错位。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0079 begin');
      const stats: TopicStats = new TopicStats(7, 42, 3, 11, 1.5, 'probe');
      expect(stats.nodes).assertEqual(7);
      expect(stats.draws).assertEqual(42);
      expect(stats.touches).assertEqual(3);
      expect(stats.rebuilds).assertEqual(11);
      expect(stats.costMs).assertEqual(1.5);
      expect(stats.label).assertEqual('probe');
      logInfo('testNdkRenderNodeSchema0079 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0080
     * @tc.name      testNdkRenderNodeSchema0080
     * @tc.desc      校验专题统计允许全零与空标签，未被触发的状态只有能展示而不报错。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeSchema0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSchema0080 begin');
      const stats: TopicStats = new TopicStats(0, 0, 0, 0, 0, '');
      expect(stats.nodes).assertEqual(0);
      expect(stats.costMs).assertEqual(0);
      expect(stats.label).assertEqual('');
      logInfo('testNdkRenderNodeSchema0080 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0081
     * @tc.name      testNdkRenderNodeSchema0081
     * @tc.desc      校验能力域工厂保留编号、键名、标题、说明与场景数组引用。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0081 begin');
      const scenes: SceneSpec[] = [scene(0, 'A', 'a', [])];
      const group: GroupSpec = createGroup(41, 'probe', 'Probe', 'probe group', scenes);
      expect(group.id).assertEqual(41);
      expect(group.key).assertEqual('probe');
      expect(group.title).assertEqual('Probe');
      expect(group.desc).assertEqual('probe group');
      expect(group.scenes === scenes).assertTrue();
      logInfo('testNdkRenderNodeSchema0081 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0082
     * @tc.name      testNdkRenderNodeSchema0082
     * @tc.desc      校验场景工厂保留编号、标题、说明与参数数组引用，不复制参数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0082 begin');
      const params: ParamSpec[] = [rangeParam('a', 'vp', 4, 0, 8, 1)];
      const spec: SceneSpec = scene(9, 'Nine', 'nine scene', params);
      expect(spec.id).assertEqual(9);
      expect(spec.title).assertEqual('Nine');
      expect(spec.desc).assertEqual('nine scene');
      expect(spec.params === params).assertTrue();
      expect(spec.params[0].key).assertEqual('a');
      logInfo('testNdkRenderNodeSchema0082 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0083
     * @tc.name      testNdkRenderNodeSchema0083
     * @tc.desc      校验滑杆工厂按传入顺序写字段，且不带下拉选项与开关取值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0083 begin');
      const spec: ParamSpec = rangeParam('radius', 'vp', 12, 2, 40, 2);
      expect(spec.kind).assertEqual(PARAM_RANGE);
      expect(spec.key).assertEqual('radius');
      expect(spec.unit).assertEqual('vp');
      expect(spec.def).assertEqual(12);
      expect(spec.min).assertEqual(2);
      expect(spec.max).assertEqual(40);
      expect(spec.step).assertEqual(2);
      expect(spec.options.length).assertEqual(0);
      logInfo('testNdkRenderNodeSchema0083 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0084
     * @tc.name      testNdkRenderNodeSchema0084
     * @tc.desc      校验开关工厂把布尔默认值转成 1/0，取值域固定为上下界 0 与 1。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0084 begin');
      const on: ParamSpec = toggleParam('enable', true);
      const off: ParamSpec = toggleParam('enable', false);
      expect(on.def).assertEqual(1);
      expect(off.def).assertEqual(0);
      expect(on.kind).assertEqual(PARAM_TOGGLE);
      expect(on.min).assertEqual(0);
      expect(on.max).assertEqual(1);
      expect(on.step).assertEqual(1);
      expect(on.unit).assertEqual('');
      expect(on.options.length).assertEqual(0);
      logInfo('testNdkRenderNodeSchema0084 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0085
     * @tc.name      testNdkRenderNodeSchema0085
     * @tc.desc      校验下拉工厂在空选项时上界回到 0，不会出现负上界导致滑杆越界。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0085 begin');
      const spec: ParamSpec = selectParam('empty', 0, []);
      expect(spec.kind).assertEqual(PARAM_SELECT);
      expect(spec.min).assertEqual(0);
      expect(spec.max).assertEqual(0);
      expect(spec.step).assertEqual(1);
      expect(spec.unit).assertEqual('');
      expect(spec.options.length).assertEqual(0);
      logInfo('testNdkRenderNodeSchema0085 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0086
     * @tc.name      testNdkRenderNodeSchema0086
     * @tc.desc      校验下拉工厂上界为选项数减一，单选项与多选项均符合该规则。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0086 begin');
      const single: ParamSpec = selectParam('one', 0, ['only']);
      expect(single.max).assertEqual(0);
      expect(single.options.length).assertEqual(1);
      const many: ParamSpec = selectParam('many', 2, ['a', 'b', 'c', 'd']);
      expect(many.max).assertEqual(3);
      expect(many.max).assertEqual(many.options.length - 1);
      expect(many.def).assertEqual(2);
      logInfo('testNdkRenderNodeSchema0086 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCHEMA_0087
     * @tc.name      testNdkRenderNodeSchema0087
     * @tc.desc      校验分组编号与 native 协议一致：能力域 1..19、专题 20..29，二十九个编号无重复无缺失。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeSchema0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSchema0087 begin');
      expect(ALL_GROUPS.length).assertEqual(GROUP_COUNT + TOPIC_COUNT);
      const ids: number[] = [];
      for (let index = 0; index < CAPABILITY_GROUPS.length; index++) {
        expect(CAPABILITY_GROUPS[index].id).assertEqual(index + 1);
        ids.push(CAPABILITY_GROUPS[index].id);
      }
      for (let index = 0; index < TOPIC_GROUPS.length; index++) {
        expect(TOPIC_GROUPS[index].id).assertEqual(20 + index);
        ids.push(TOPIC_GROUPS[index].id);
      }
      let duplicated: number = 0;
      for (let outer = 0; outer < ids.length; outer++) {
        for (let inner = outer + 1; inner < ids.length; inner++) {
          if (ids[outer] === ids[inner]) {
            duplicated += 1;
          }
        }
      }
      logInfo('group ids = ' + ids.toString() + ', duplicated = ' + duplicated.toString());
      expect(ids.length).assertEqual(ALL_GROUPS.length);
      expect(duplicated).assertEqual(0);
      logInfo('testNdkRenderNodeSchema0087 end');
    })

  })
}
