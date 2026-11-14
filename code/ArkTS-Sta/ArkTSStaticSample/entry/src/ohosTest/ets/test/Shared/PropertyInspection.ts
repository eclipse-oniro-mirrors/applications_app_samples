/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

export interface PropertySnapshot {
  hasGetter: boolean;
  hasSetter: boolean;
  enumerable: boolean;
  configurable: boolean;
}

// Reflective inspection stays in the TypeScript side of this mixed-language app.
export function inspectProperty(object: Object, key: string): PropertySnapshot {
  const descriptor = Object.getOwnPropertyDescriptor(object, key);
  if (!descriptor) {
    throw new Error('Property is missing: ' + key);
  }
  return {
    hasGetter: typeof descriptor.get === 'function',
    hasSetter: typeof descriptor.set === 'function',
    enumerable: descriptor.enumerable === true,
    configurable: descriptor.configurable === true
  };
}
