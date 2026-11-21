import registry from '@ohos.app.ability.abilityDelegatorRegistry';

export function yieldToMainThread(): Promise<void>;
export function registerTestBatches(registrations: Array<() => void>): Promise<void>;
export function runHypiumSession(delegator: registry.AbilityDelegator,
  args: registry.AbilityDelegatorArgs, register: () => Promise<void>): Promise<void>;
export function registerUiTests(register: () => void): void;
