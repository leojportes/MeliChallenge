//
//  ProductDetailsViewControllerTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 22/06/24.
//

import SnapshotTesting
import XCTest

@testable import MeliChallenge

class ProductDetailsViewControllerTests: XCTestCase {
    func test_roductDetailsViewController_shouldReturnExpectedSnapshot() {
        let sut = makeSut()
        sut.rootView.setupDescription(mockDescription)

        assertSnapshot(
            of: sut,
            as: .image(size: .init(width: 370, height: 1300)),
            record: false
        )
    }
}

extension ProductDetailsViewControllerTests {
    func makeSut() -> ProductDetailsViewController {
        ProductDetailsViewController(
            product: .stub(),
            viewModel: ProductDetailsViewModel(
                coordinator: .init(
                    with: .init(
                        navigationController: .init()
                    )
                )
            ),
            coordinator: ProductDetailsCoordinator(
                with: .init(
                    navigationController: .init()
                )
            )
        )
    }
}

private let mockDescription = "O iPhone 14 tem o sistema de câmera dupla mais impressionante em um iPhone, para fazer fotos espetaculares em pouca e muita luz. E você ganha tranquilidade com nosso novo recurso essencial de segurança. Aviso legal (1) A tela tem bordas arredondadas. Quando medida como um retângulo, a tela tem 6,06 polegadas na diagonal. A área real de visualização é menor. (2) A função SOS de Emergência usa uma conexão de rede celular ou chamadas Wi-Fi. (3) A duração da bateria varia de acordo com seu uso e configuração. Consulte apple.com/br/batteries para obter mais informações. (4) Se requer um plano de dados. 5G está disponível em alguns mercados e através de algumas operadoras específicas. As velocidades variam segundo as condições do lugar e da operadora. Para obter detalhes sobre a compatibilidade com 5G, entre em contato com sua operadora e consulte apple.com/br/iphone/celular."
