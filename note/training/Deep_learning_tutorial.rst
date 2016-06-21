機械学習: Machine learningは以下の二つに分けられる

Supervised Learning         教師あり学習
    入力データ：（x、y）　＝　（データ、ラベル）
    目的：mapping 関数　(x->y)を学習
    タスク：Classification,regression, object detection,semantic segmentation, imagecaptioning, etc
Unsupervised learning       教師なし学習
    入力Data: x      －＞　ラベルがない
    目的：データの構成を学習
    タスク:Clustering,dimensionality reduction, featurelearning, generative models, etc.

タスクに対して、一番重要なことは「特徴、features」です。

機械学習の中に、以下の二つの概念があります。


shallow learningの特徴：SIFT,など
deep learning

    Deep learningの一つのstage
        Convolution -> normalize -> pooling
    SIFTの流れ
        Apply Gabor Filter  -> Spatial Pool  -> Normalize

Deep learningの場合、多くのstageがあります：
    GoogLeNet: 9 stage
    AlexNet : 3 stage
SIFTは一つのstageしかありません。
    -> shallow learning

Deep learningは機械学習の一つのツールです。
「Supervised Learning」と　「Unsupervised learning」
の両方に対応できます。
学習方法は「foward propagation」 + 「back propagation」による行います。
種類として、CNN,RNN,LSTMなどがあります。

「Supervised Learning」の実装例: AlexNet


