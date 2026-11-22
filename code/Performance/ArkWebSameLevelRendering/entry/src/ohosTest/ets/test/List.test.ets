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

import { EmbedDocumentHost } from './EmbedDocumentHost';
import productCtorEdge01Test from './ProductCtorEdge01.test';
import productCtorEdge02Test from './ProductCtorEdge02.test';
import productFieldSequence01Test from './ProductFieldSequence01.test';
import productFieldSequence02Test from './ProductFieldSequence02.test';
import productFieldSequence03Test from './ProductFieldSequence03.test';
import productCatalogSequence01Test from './ProductCatalogSequence01.test';
import productCatalogSequence02Test from './ProductCatalogSequence02.test';
import embedNodeSequence01 from './EmbedNodeSequence01.test';
import embedNodeSequence02 from './EmbedNodeSequence02.test';
import embedQueryGuard01 from './EmbedQueryGuard01.test';
import embedQueryGuard02 from './EmbedQueryGuard02.test';
import embedSnapshotSequence01 from './EmbedSnapshotSequence01.test';
import embedSnapshotSequence02 from './EmbedSnapshotSequence02.test';
import embedSizeEdge01 from './EmbedSizeEdge01.test';
import embedSizeEdge02 from './EmbedSizeEdge02.test';
import embedBoxSequence01 from './EmbedBoxSequence01.test';
import embedBoxSequence02 from './EmbedBoxSequence02.test';
import embedPercentSequence01 from './EmbedPercentSequence01.test';
import embedPercentSequence02 from './EmbedPercentSequence02.test';
import embedTouchNotifyNN from './EmbedTouchNotifyNN.test';
import embedListenerSequenceNN from './EmbedListenerSequenceNN.test';
import embedEventRouteNN from './EmbedEventRouteNN.test';
import embedDocumentSequence from './EmbedDocumentSequence.test';

export default function testsuite(): void {
  const host: EmbedDocumentHost = new EmbedDocumentHost();
  productCtorEdge01Test();
  productCtorEdge02Test();
  productFieldSequence01Test();
  productFieldSequence02Test();
  productFieldSequence03Test();
  productCatalogSequence01Test();
  productCatalogSequence02Test();
  embedNodeSequence01(host);
  embedNodeSequence02(host);
  embedQueryGuard01(host);
  embedQueryGuard02(host);
  embedSnapshotSequence01(host);
  embedSnapshotSequence02(host);
  embedSizeEdge01(host);
  embedSizeEdge02(host);
  embedBoxSequence01(host);
  embedBoxSequence02(host);
  embedPercentSequence01(host);
  embedPercentSequence02(host);
  embedTouchNotifyNN(host);
  embedListenerSequenceNN(host);
  embedEventRouteNN(host);
  embedDocumentSequence(host);
}
