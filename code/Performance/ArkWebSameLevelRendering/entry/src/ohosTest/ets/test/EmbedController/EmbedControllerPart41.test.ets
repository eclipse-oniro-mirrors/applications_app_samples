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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { yieldTestEventLoop } from '../Shared/TestScheduling';
import { NodeControllerParams, SearchNodeController } from '../../../../main/ets/pages/Index';
import { NodeRenderType } from '@kit.ArkUI';

export default function EmbedControllerPart41(): void {
  describe('EmbedControllerPart41', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number EmbedControllerPart41_0001_controller_width0_height2_embed5
    // @tc.name EmbedControllerPart41_0001_controller_width0_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0001_controller_width0_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0002_controller_width1_height2_embed5
    // @tc.name EmbedControllerPart41_0002_controller_width1_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0002_controller_width1_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0003_controller_width2_height2_embed5
    // @tc.name EmbedControllerPart41_0003_controller_width2_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0003_controller_width2_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0004_controller_width3_height2_embed5
    // @tc.name EmbedControllerPart41_0004_controller_width3_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0004_controller_width3_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0005_controller_width4_height2_embed5
    // @tc.name EmbedControllerPart41_0005_controller_width4_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0005_controller_width4_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0006_controller_width5_height2_embed5
    // @tc.name EmbedControllerPart41_0006_controller_width5_height2_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0006_controller_width5_height2_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-2-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-2',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
        height: 320,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0007_controller_width0_height3_embed5
    // @tc.name EmbedControllerPart41_0007_controller_width0_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0007_controller_width0_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0008_controller_width1_height3_embed5
    // @tc.name EmbedControllerPart41_0008_controller_width1_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0008_controller_width1_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0009_controller_width2_height3_embed5
    // @tc.name EmbedControllerPart41_0009_controller_width2_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0009_controller_width2_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0010_controller_width3_height3_embed5
    // @tc.name EmbedControllerPart41_0010_controller_width3_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0010_controller_width3_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0011_controller_width4_height3_embed5
    // @tc.name EmbedControllerPart41_0011_controller_width4_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0011_controller_width4_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0012_controller_width5_height3_embed5
    // @tc.name EmbedControllerPart41_0012_controller_width5_height3_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0012_controller_width5_height3_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-3-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-3',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
        height: 360,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0013_controller_width0_height4_embed5
    // @tc.name EmbedControllerPart41_0013_controller_width0_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0013_controller_width0_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0014_controller_width1_height4_embed5
    // @tc.name EmbedControllerPart41_0014_controller_width1_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0014_controller_width1_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0015_controller_width2_height4_embed5
    // @tc.name EmbedControllerPart41_0015_controller_width2_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0015_controller_width2_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0016_controller_width3_height4_embed5
    // @tc.name EmbedControllerPart41_0016_controller_width3_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0016_controller_width3_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0017_controller_width4_height4_embed5
    // @tc.name EmbedControllerPart41_0017_controller_width4_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0017_controller_width4_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0018_controller_width5_height4_embed5
    // @tc.name EmbedControllerPart41_0018_controller_width5_height4_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0018_controller_width5_height4_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-4-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-4',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
        height: 600,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0019_controller_width0_height5_embed5
    // @tc.name EmbedControllerPart41_0019_controller_width0_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0019_controller_width0_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0020_controller_width1_height5_embed5
    // @tc.name EmbedControllerPart41_0020_controller_width1_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0020_controller_width1_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0021_controller_width2_height5_embed5
    // @tc.name EmbedControllerPart41_0021_controller_width2_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0021_controller_width2_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0022_controller_width3_height5_embed5
    // @tc.name EmbedControllerPart41_0022_controller_width3_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0022_controller_width3_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0023_controller_width4_height5_embed5
    // @tc.name EmbedControllerPart41_0023_controller_width4_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0023_controller_width4_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0024_controller_width5_height5_embed5
    // @tc.name EmbedControllerPart41_0024_controller_width5_height5_embed5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0024_controller_width5_height5_embed5', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-5-5';
      const options: NodeControllerParams = {
        surfaceId: 'surface-5',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
        height: 1024,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0025_controller_width0_height0_embed0
    // @tc.name EmbedControllerPart41_0025_controller_width0_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0025_controller_width0_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0026_controller_width1_height0_embed0
    // @tc.name EmbedControllerPart41_0026_controller_width1_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0026_controller_width1_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0027_controller_width2_height0_embed0
    // @tc.name EmbedControllerPart41_0027_controller_width2_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0027_controller_width2_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0028_controller_width3_height0_embed0
    // @tc.name EmbedControllerPart41_0028_controller_width3_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0028_controller_width3_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0029_controller_width4_height0_embed0
    // @tc.name EmbedControllerPart41_0029_controller_width4_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0029_controller_width4_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0030_controller_width5_height0_embed0
    // @tc.name EmbedControllerPart41_0030_controller_width5_height0_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0030_controller_width5_height0_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-0-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-0',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
        height: 0,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0031_controller_width0_height1_embed0
    // @tc.name EmbedControllerPart41_0031_controller_width0_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0031_controller_width0_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 0,
        height: 1,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });

    // @tc.number EmbedControllerPart41_0032_controller_width1_height1_embed0
    // @tc.name EmbedControllerPart41_0032_controller_width1_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart41_0032_controller_width1_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'surface-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1,
        height: 1,
      };
      controller.setRenderOption(options);
      const configuredId: string = controller.getEmbedId();
      expect(configuredId).assertEqual(expectedId);
      controller.updateNode({ width: 320, height: 480 });
      controller.setBuilderNode(null);
      const root = controller.getBuilderNode();
      const hasRoot: boolean = root !== null;
      expect(hasRoot).assertFalse();
      const retainedId: string = controller.getEmbedId();
      expect(retainedId).assertEqual(expectedId);
    });
  });
}
