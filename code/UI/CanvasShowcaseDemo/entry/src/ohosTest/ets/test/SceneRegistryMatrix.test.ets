import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { SceneRegistry, SceneInfo } from '../../../main/ets/model/utils/SceneRegistry';

/**
 * SceneRegistry 场景注册表矩阵套件
 * 在 SceneRegistry.test 基础上补齐 id/文案映射矩阵：
 * id 从 1 连续且为正整数、首末场景已知映射、补充场景按钮与标题差异、按钮/标题唯一、
 * getById 边界（0/小数）与引用一致性、getAll 稳定性、draw 均可调用、
 * 每个场景在新画布上无头绘制、文案无首尾空白、前 12 场景标题与按钮一致、
 * 核心/扩展/补充分组前缀、逐 id 引用一致。
 */
export default function sceneRegistryMatrixTest() {
  describe('sceneRegistryMatrixTest', () => {
    let scenes: SceneInfo[] = [];

    beforeAll(() => {
      scenes = SceneRegistry.getAll();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0100
     * @tc.name idsContiguousFromOne0100
     * @tc.desc Verify scene ids run contiguously from 1 in array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ids_contiguousFromOne', 0, () => {
      for (let i = 0; i < scenes.length; i++) {
        expect(scenes[i].id).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0200
     * @tc.name idsPositiveIntegers0200
     * @tc.desc Verify every id is a positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ids_positiveIntegers', 0, () => {
      for (const s of scenes) {
        expect(s.id > 0).assertTrue();
        expect(Math.floor(s.id)).assertEqual(s.id);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0300
     * @tc.name firstSceneMapping0300
     * @tc.desc Verify scene id 1 maps to the linear gradient scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('firstScene_mapping', 0, () => {
      const first: SceneInfo | null = SceneRegistry.getById(1);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.button).assertEqual('场景1：线性渐变与渐变描边');
        expect(first.title).assertEqual('场景1：线性渐变与渐变描边');
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0400
     * @tc.name lastSceneMapping0400
     * @tc.desc Verify the last scene maps to the ImageData readback entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lastScene_mapping', 0, () => {
      const last: SceneInfo | null = SceneRegistry.getById(23);
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.button).assertEqual('扩展：ImageData 回读反相');
        expect(last.title).assertEqual('扩展：getImageData 回读与像素反相');
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0500
     * @tc.name supplementButtonTitleDiffer0500
     * @tc.desc Verify supplement scenes use a short button label and a longer title
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('supplement_buttonTitleDiffer', 0, () => {
      const s13: SceneInfo | null = SceneRegistry.getById(13);
      const s14: SceneInfo | null = SceneRegistry.getById(14);
      expect(s13 !== null).assertTrue();
      expect(s14 !== null).assertTrue();
      if (s13 !== null) {
        expect(s13.button).assertEqual('补充：图案矩阵变换（Pattern×Matrix2D）');
        expect(s13.title).assertEqual('补充：CanvasPattern.setTransform 图案矩阵变换');
        expect(s13.button === s13.title).assertFalse();
      }
      if (s14 !== null) {
        expect(s14.button === s14.title).assertFalse();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0600
     * @tc.name buttonsUnique0600
     * @tc.desc Verify every button label is unique
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buttons_unique', 0, () => {
      const seen: Set<string> = new Set();
      for (const s of scenes) {
        expect(seen.has(s.button)).assertFalse();
        seen.add(s.button);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0700
     * @tc.name titlesUnique0700
     * @tc.desc Verify every scene title is unique
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('titles_unique', 0, () => {
      const seen: Set<string> = new Set();
      for (const s of scenes) {
        expect(seen.has(s.title)).assertFalse();
        seen.add(s.title);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0800
     * @tc.name getByIdZeroReturnsNull0800
     * @tc.desc Verify id 0 does not resolve to any scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_zero_returnsNull', 0, () => {
      expect(SceneRegistry.getById(0) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_0900
     * @tc.name getByIdFractionReturnsNull0900
     * @tc.desc Verify fractional ids do not resolve to any scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_fraction_returnsNull', 0, () => {
      expect(SceneRegistry.getById(1.5) === null).assertTrue();
      expect(SceneRegistry.getById(2.5) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1000
     * @tc.name getByIdReturnsRegistryReference1000
     * @tc.desc Verify getById returns the same object stored in the registry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_returnsRegistryReference', 0, () => {
      const fromGet: SceneInfo | null = SceneRegistry.getById(5);
      expect(fromGet !== null).assertTrue();
      expect(fromGet === scenes[4]).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1100
     * @tc.name getAllStableAcrossCalls1100
     * @tc.desc Verify repeated getAll calls return a stable list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getAll_stableAcrossCalls', 0, () => {
      const again: SceneInfo[] = SceneRegistry.getAll();
      expect(again.length).assertEqual(scenes.length);
      expect(again === scenes).assertTrue();
      expect(SceneRegistry.count()).assertEqual(again.length);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1200
     * @tc.name drawIsFunctionForAll1200
     * @tc.desc Verify every scene exposes a callable draw callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('draw_isFunctionForAll', 0, () => {
      for (const s of scenes) {
        expect(typeof s.draw === 'function').assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1300
     * @tc.name eachSceneDrawsOnFreshCanvas1300
     * @tc.desc Verify each scene draws onto its own offscreen canvas and yields a bitmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('eachScene_drawsOnFreshCanvas', 0, () => {
      // 每个场景独立画布，避免前序场景状态污染；输出尺寸必须保持
      for (const s of scenes) {
        const off = new OffscreenCanvas(80, 40);
        const ctx = off.getContext('2d');
        s.draw(ctx, 80, 40);
        const bmp = off.transferToImageBitmap();
        expect(bmp.width).assertEqual(80);
        expect(bmp.height).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1400
     * @tc.name buttonTitlesTrimmed1400
     * @tc.desc Verify button labels and titles carry no leading or trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buttonTitles_trimmed', 0, () => {
      for (const s of scenes) {
        expect(s.button === s.button.trim()).assertTrue();
        expect(s.title === s.title.trim()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1500
     * @tc.name firstTwelveTitlesMatchButtons1500
     * @tc.desc Verify the first twelve scenes share the same button label and title
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('firstTwelve_titlesMatchButtons', 0, () => {
      for (let i = 0; i < 12; i++) {
        expect(scenes[i].button).assertEqual(scenes[i].title);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1600
     * @tc.name sceneGroupPrefixes1600
     * @tc.desc Verify core, extended and supplement scenes carry their group prefixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scene_groupPrefixes', 0, () => {
      expect(scenes[0].button.substring(0, 3)).assertEqual('场景1');
      expect(scenes[1].button.substring(0, 3)).assertEqual('场景1');
      expect(scenes[2].button.substring(0, 3)).assertEqual('场景2');
      expect(scenes[3].button.substring(0, 3)).assertEqual('场景2');
      expect(scenes[4].button.substring(0, 3)).assertEqual('场景3');
      expect(scenes[9].button.substring(0, 3)).assertEqual('场景3');
      expect(scenes[10].button.substring(0, 2)).assertEqual('扩展');
      expect(scenes[11].button.substring(0, 2)).assertEqual('扩展');
      expect(scenes[12].button.substring(0, 2)).assertEqual('补充');
      expect(scenes[16].button.substring(0, 2)).assertEqual('补充');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRYMATRIX_1700
     * @tc.name getByIdEveryIdHitsReference1700
     * @tc.desc Verify every id resolves to the corresponding registry entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_everyId_hitsReference', 0, () => {
      for (let i = 0; i < scenes.length; i++) {
        const found: SceneInfo | null = SceneRegistry.getById(i + 1);
        expect(found !== null).assertTrue();
        expect(found === scenes[i]).assertTrue();
      }
    });
  });
}
