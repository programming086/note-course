import UIKit

protocol FileTableViewCellDelegate: class {
    func loadImage(stringUrl: String, completion: @escaping ((UIImage?) -> Void))
}

final class FileTableViewCell: UITableViewCell {

    weak var delegate: FileTableViewCellDelegate?

    private let photoImageView = UIImageView()
    private let fileNameLabel = UILabel()
    private let fileSizeLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindModel(_ model: DiskFile) {
        fileNameLabel.text = model.name
        let size = Double(model.size) / 1024.0 / 1024.0
        fileSizeLabel.text = String(format: "%.2f", size) + " МБ"

        if let previewUrl = model.preview {
            delegate?.loadImage(stringUrl: previewUrl, completion: { [weak self] (image) in
                self?.photoImageView.image = image
            })
        }
    }

    func updateImage(_ image: UIImage?) {
        photoImageView.image = image
    }

    override func prepareForReuse() {
        photoImageView.image = nil
        super.prepareForReuse()
    }

    // MARK: Private

    private func setupViews() {
        photoImageView.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        fileSizeLabel.font = UIFont.systemFont(ofSize: 11)

        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        fileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fileSizeLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(photoImageView)
        addSubview(fileNameLabel)
        addSubview(fileSizeLabel)

        fileSizeLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: photoSize.width),
            photoImageView.heightAnchor.constraint(equalToConstant: photoSize.height),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: inset / 2),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset / 2),

            fileNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: inset),
            fileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            fileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),

            fileSizeLabel.topAnchor.constraint(equalTo: fileNameLabel.bottomAnchor),
            fileSizeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset / 2),
            fileSizeLabel.trailingAnchor.constraint(equalTo: fileNameLabel.trailingAnchor),
        ])
    }
}

private let photoSize = CGSize(width: 80, height: 80)
private let inset: CGFloat = 16
