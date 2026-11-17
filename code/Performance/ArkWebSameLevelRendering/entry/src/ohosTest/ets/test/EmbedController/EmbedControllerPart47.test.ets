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

export default function EmbedControllerPart47(): void {
  describe('EmbedControllerPart47', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number EmbedControllerPart47_0001_controller_width1_height1_embed0
    // @tc.name EmbedControllerPart47_0001_controller_width1_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0001_controller_width1_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-1',
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

    // @tc.number EmbedControllerPart47_0002_controller_width2_height1_embed0
    // @tc.name EmbedControllerPart47_0002_controller_width2_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0002_controller_width2_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 320,
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

    // @tc.number EmbedControllerPart47_0003_controller_width3_height1_embed0
    // @tc.name EmbedControllerPart47_0003_controller_width3_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0003_controller_width3_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 360,
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

    // @tc.number EmbedControllerPart47_0004_controller_width4_height1_embed0
    // @tc.name EmbedControllerPart47_0004_controller_width4_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0004_controller_width4_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 600,
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

    // @tc.number EmbedControllerPart47_0005_controller_width5_height1_embed0
    // @tc.name EmbedControllerPart47_0005_controller_width5_height1_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0005_controller_width5_height1_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-1-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-1',
        type: 'native/component',
        renderType: NodeRenderType.RENDER_TYPE_TEXTURE,
        embedId: expectedId,
        width: 1024,
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

    // @tc.number EmbedControllerPart47_0006_controller_width0_height2_embed0
    // @tc.name EmbedControllerPart47_0006_controller_width0_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0006_controller_width0_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0007_controller_width1_height2_embed0
    // @tc.name EmbedControllerPart47_0007_controller_width1_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0007_controller_width1_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0008_controller_width2_height2_embed0
    // @tc.name EmbedControllerPart47_0008_controller_width2_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0008_controller_width2_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0009_controller_width3_height2_embed0
    // @tc.name EmbedControllerPart47_0009_controller_width3_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0009_controller_width3_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0010_controller_width4_height2_embed0
    // @tc.name EmbedControllerPart47_0010_controller_width4_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0010_controller_width4_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0011_controller_width5_height2_embed0
    // @tc.name EmbedControllerPart47_0011_controller_width5_height2_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0011_controller_width5_height2_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-2-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-2',
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

    // @tc.number EmbedControllerPart47_0012_controller_width0_height3_embed0
    // @tc.name EmbedControllerPart47_0012_controller_width0_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0012_controller_width0_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0013_controller_width1_height3_embed0
    // @tc.name EmbedControllerPart47_0013_controller_width1_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0013_controller_width1_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0014_controller_width2_height3_embed0
    // @tc.name EmbedControllerPart47_0014_controller_width2_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0014_controller_width2_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0015_controller_width3_height3_embed0
    // @tc.name EmbedControllerPart47_0015_controller_width3_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0015_controller_width3_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0016_controller_width4_height3_embed0
    // @tc.name EmbedControllerPart47_0016_controller_width4_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0016_controller_width4_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0017_controller_width5_height3_embed0
    // @tc.name EmbedControllerPart47_0017_controller_width5_height3_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0017_controller_width5_height3_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-3-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-3',
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

    // @tc.number EmbedControllerPart47_0018_controller_width0_height4_embed0
    // @tc.name EmbedControllerPart47_0018_controller_width0_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0018_controller_width0_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0019_controller_width1_height4_embed0
    // @tc.name EmbedControllerPart47_0019_controller_width1_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0019_controller_width1_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-1-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0020_controller_width2_height4_embed0
    // @tc.name EmbedControllerPart47_0020_controller_width2_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0020_controller_width2_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-2-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0021_controller_width3_height4_embed0
    // @tc.name EmbedControllerPart47_0021_controller_width3_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0021_controller_width3_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-3-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0022_controller_width4_height4_embed0
    // @tc.name EmbedControllerPart47_0022_controller_width4_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0022_controller_width4_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-4-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0023_controller_width5_height4_embed0
    // @tc.name EmbedControllerPart47_0023_controller_width5_height4_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0023_controller_width5_height4_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-5-4-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-4',
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

    // @tc.number EmbedControllerPart47_0024_controller_width0_height5_embed0
    // @tc.name EmbedControllerPart47_0024_controller_width0_height5_embed0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc SearchNodeController setRenderOption preserves embed identity and safely handles an absent BuilderNode
    it('EmbedControllerPart47_0024_controller_width0_height5_embed0', 0, (): void => {
      const controller: SearchNodeController = new SearchNodeController();
      const initialId: string = controller.getEmbedId();
      expect(initialId).assertEqual('');
      const expectedId: string = 'nativeSearch-0-5-0';
      const options: NodeControllerParams = {
        surfaceId: 'render-target-5',
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
  });
}
