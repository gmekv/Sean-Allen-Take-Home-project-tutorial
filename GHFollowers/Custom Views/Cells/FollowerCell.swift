
import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageVIew = UIImageView()
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Ini(coder:) has been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
    }
    
    private func configure() {
        addSubview(avatarImageVIew)
        let padding:CGFloat = 8

        NSLayoutConstraint.activate([
            avatarImageVIew.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageVIew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageVIew.heightAnchor.constraint(equalTo: avatarImageVIew.widthAnchor ),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageVIew.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
