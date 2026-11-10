/** 发布当前 UIAbility 的运行时实例，供页面订阅。 */
import { LearningController } from './LearningController';

let currentController: LearningController | undefined = undefined;

export function publishLearningController(controller: LearningController): void {
  currentController = controller;
}

export function getLearningController(): LearningController | undefined {
  return currentController;
}

export function clearLearningController(): void {
  currentController = undefined;
}
