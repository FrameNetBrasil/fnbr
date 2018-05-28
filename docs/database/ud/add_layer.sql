-- adding UD layers to an existing AS

insert into Layer (rank, idAnnotationSet, idLayerType) values
(1, 63021, (select idLayerType from LayerType where entry = 'lty_udpos')),
(1, 63021, (select idLayerType from LayerType where entry = 'lty_udrelation')),
(1, 63022, (select idLayerType from LayerType where entry = 'lty_udpos')),
(1, 63022, (select idLayerType from LayerType where entry = 'lty_udrelation')),
(1, 63023, (select idLayerType from LayerType where entry = 'lty_udpos')),
(1, 63023, (select idLayerType from LayerType where entry = 'lty_udrelation')),
(1, 63024, (select idLayerType from LayerType where entry = 'lty_udpos')),
(1, 63024, (select idLayerType from LayerType where entry = 'lty_udrelation')),
(1, 63025, (select idLayerType from LayerType where entry = 'lty_udpos')),
(1, 63025, (select idLayerType from LayerType where entry = 'lty_udrelation'));

