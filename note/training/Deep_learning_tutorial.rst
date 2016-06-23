Deep learningの纏め
======================

// すでに、知ったものを纏め

機械学習について
--------------

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

Deep learningについて
----------------------




CUDA,並列プログラミングについて
--------------------------------
https://nvidia.qwiklab.com/focuses/37
account : gachiemchiep@gmail.com
password: matkhauthuongdung

ubuntu-drivers devices

Installが必要ない　-＞　Webで動ける　－＞　あまり、効果がないね

Caltechの" GPU Programming "コースを受けましょう