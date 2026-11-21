import { describe, it } from '@ohos/hypium';
import {
  SCENES, Scene, assertScene, assertSwitch, backgroundAndRestoreEntry, toggleTo, withScene
} from '../Shared/SharedDriver';
import {
  reenterThroughIndex, reopenScene, toggleByCoordinates, visitOtherSceneAndResume
} from '../Integration/RenderGroupMatrixActions';
import { assertGridTextPainted } from './RenderGroupPaintProbe';

class PaintWorkflow {
  public name: string;
  public operation: number;

  constructor(name: string, operation: number) {
    this.name = name;
    this.operation = operation;
  }
}

const WORKFLOWS: PaintWorkflow[] = [
  new PaintWorkflow('Initial', 0),
  new PaintWorkflow('ComponentToggle', 1),
  new PaintWorkflow('CoordinateToggle', 2),
  new PaintWorkflow('ForegroundRestore', 3),
  new PaintWorkflow('ToolbarRecreate', 4),
  new PaintWorkflow('SystemRecreate', 5),
  new PaintWorkflow('CrossScene', 6),
  new PaintWorkflow('IndexRecreate', 7)
];

async function exercise(scene: Scene, enabled: boolean, operation: number): Promise<boolean> {
  if (operation === 1) {
    await toggleTo(!enabled);
    return !enabled;
  }
  if (operation === 2) {
    await toggleByCoordinates(!enabled);
    return !enabled;
  }
  if (operation === 3) {
    await backgroundAndRestoreEntry();
  } else if (operation === 4 || operation === 5) {
    await reopenScene(scene, operation === 5);
    return false;
  } else if (operation === 6) {
    await visitOtherSceneAndResume(scene);
    return false;
  } else if (operation === 7) {
    await reenterThroughIndex(scene);
    return false;
  }
  return enabled;
}

export default function renderGroupPaintTest(): void {
  describe('RenderGroupPaint', () => {
    for (const scene of SCENES) {
      for (const enabled of [false, true]) {
        for (const workflow of WORKFLOWS) {
          it(`${scene.name}Paint${workflow.name}From${enabled ? 'Enabled' : 'Disabled'}`, 0, async () => {
            await withScene(scene, async () => {
              if (enabled) {
                await toggleTo(true);
              }
              await assertSwitch(enabled);
              await assertGridTextPainted();
              const expected = await exercise(scene, enabled, workflow.operation);
              await assertScene(scene);
              await assertSwitch(expected);
              await assertGridTextPainted();
              await toggleTo(!expected);
              await assertGridTextPainted();
            });
          });
        }
      }
    }
  });
}
