/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { IDataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { LayoutData } from 'library/src/main/ets/components/dyn/CommonType';
import { ICardResolver } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { EtsFactory, IEtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { waitForNativeFactory } from './ScenarioSupport';
import { expect } from '@ohos/hypium';

export class CallbackResolver implements ICardResolver {
  models: DataModel[] = [];
  cards: CardData[] = [];
  action: (model: DataModel, index: number) => CardData;

  constructor(action: (model: DataModel, index: number) => CardData) {
    this.action = action;
  }

  createData(model: DataModel): CardData {
    const index = this.models.length;
    this.models.push(model);
    const card = this.action(model, index);
    this.cards.push(card);
    return card;
  }
}

class PendingParse {
  promise: Promise<DataSource>;
  resolve: (source: DataSource) => void = () => {};
  reject: (error: Error) => void = () => {};

  constructor() {
    this.promise = new Promise<DataSource>((resolve, reject) => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}

// Requests settle explicitly; tests do not depend on timer races.
export class DeferredParser implements IDataParser {
  inputs: LayoutData[] = [];
  private pending: PendingParse[] = [];

  parse(input: LayoutData): Promise<DataSource> {
    this.inputs.push(input);
    const request = new PendingParse();
    this.pending.push(request);
    return request.promise;
  }

  complete(index: number, source: DataSource): void {
    this.pending[index].resolve(source);
  }

  fail(index: number, error: Error): void {
    this.pending[index].reject(error);
  }
}

export class ParserFactory implements IEtsFactory {
  calls: number = 0;
  parser: IDataParser;
  failure: Error | undefined = undefined;

  constructor(parser: IDataParser) {
    this.parser = parser;
  }

  newDataParser(): IDataParser {
    this.calls++;
    if (this.failure !== undefined) {
      throw this.failure;
    }
    return this.parser;
  }
}

export async function withParser(
  parser: IDataParser, body: (wrapper: DataParserStaW) => Promise<void>
): Promise<void> {
  await waitForNativeFactory();
  const previous = EtsFactory.factory;
  const factory = new ParserFactory(parser);
  EtsFactory.factory = factory;
  try {
    await body(new DataParserStaW());
    expect(factory.calls).assertEqual(1);
  } finally {
    EtsFactory.factory = previous;
  }
}

export class ProbeSource extends DataSource {
  events: string[] = [];
  countFailure: Error | undefined = undefined;
  readFailure: Error | undefined = undefined;
  failIndex: number = -1;
  reportedCount: number | undefined = undefined;
  onRead: (index: number) => void = () => {};

  totalCount(): number {
    this.events.push('count');
    if (this.countFailure !== undefined) {
      throw this.countFailure;
    }
    return this.reportedCount === undefined ? super.totalCount() : this.reportedCount;
  }

  getData(index: number): CardData {
    this.events.push('read:' + index);
    if (index === this.failIndex && this.readFailure !== undefined) {
      throw this.readFailure;
    }
    this.onRead(index);
    return super.getData(index);
  }
}

export async function expectRejection(promise: Promise<DataSource>, error: Error): Promise<void> {
  let caught: Error | undefined = undefined;
  try {
    await promise;
  } catch (value) {
    caught = value as Error;
  }
  expect(caught === error).assertTrue();
}

export function expectSyncFailure(action: () => void, error: Error): void {
  let caught: Error | undefined = undefined;
  try {
    action();
  } catch (value) {
    caught = value as Error;
  }
  expect(caught === error).assertTrue();
}

export async function yieldBetweenCases(): Promise<void> {
  await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
}
