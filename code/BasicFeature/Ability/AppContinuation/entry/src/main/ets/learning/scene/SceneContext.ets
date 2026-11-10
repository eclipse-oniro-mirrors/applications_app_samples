import { SceneWorkbench } from './SceneWorkbench';

let current: SceneWorkbench | undefined = undefined;

export function publishSceneWorkbench(workbench: SceneWorkbench): void {
  current = workbench;
}

export function getSceneWorkbench(): SceneWorkbench | undefined {
  return current;
}

export function clearSceneWorkbench(): void {
  current = undefined;
}
